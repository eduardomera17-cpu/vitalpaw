import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../domain/auth/entities/app_user.dart';
import '../../../domain/auth/entities/auth_exception.dart';
import '../../../domain/auth/repositories/auth_repository.dart';
import '../datasources/firebase_auth_datasource.dart';
import '../datasources/local_auth_datasource.dart';

// IMPLEMENTACIÓN DEL ORQUESTADOR DE USUARIOS (REPOSITORIO DE AUTENTICACIÓN)
// Esta clase es la que cumple el "Contrato" de 'AuthRepository'.
// Funciona como un director de orquesta: coordina las llamadas al servidor en la nube (Firebase)
// y a la base de datos del celular (Local SQLite) al mismo tiempo para que todo esté sincronizado.

class AuthRepositoryImpl implements AuthRepository {
  // Conector a Firebase (Nube)
  final FirebaseAuthDatasource firebaseDatasource;
  // Conector a SQLite (Teléfono)
  final LocalAuthDatasource localDatasource;

  AuthRepositoryImpl({
    required this.firebaseDatasource,
    required this.localDatasource,
  });

  /// [authStateChanges] escucha continuamente si la sesión cambia en el servidor (Firebase)
  /// y reacciona de la siguiente manera:
  ///
  /// 1. Si no hay usuario en Firebase (sesión cerrada) → devuelve 'null'.
  /// 2. Si hay un usuario en Firebase → verifica si ya lo tenemos guardado en la base de datos del celular.
  /// 3. Si no lo tenemos en el celular, lee el "Rol" del usuario de sus datos en Firebase (Claims),
  ///    crea un registro en la base de datos local y le asigna un ID único (UUID).
  @override
  Stream<AppUser?>
  get authStateChanges => firebaseDatasource.authStateChanges.asyncMap((
    firebaseUser,
  ) async {
    // Si Firebase dice que no hay nadie conectado, no hacemos nada más.
    if (firebaseUser == null) return null;

    // Buscamos si ya guardamos los datos de este usuario en el teléfono anteriormente
    final localUser = await localDatasource.getCurrentUser();
    if (localUser != null && localUser.firebaseUid == firebaseUser.uid) {
      // Si coincide el usuario local con el de internet, lo devolvemos rápido (sin consultar la nube)
      return localUser;
    }

    // Si es la primera vez que inicia sesión en este celular o no estaba guardado localmente:
    // 1. Obtenemos su "IdTokenResult", que contiene información extra de seguridad.
    final idTokenResult = await firebaseUser.getIdTokenResult();
    // 2. Extraemos el Rol del usuario (admin, staff, client, driver). Si no tiene, asumimos 'client' (cliente).
    final role = idTokenResult.claims?['role'] as String? ?? 'client';

    // 3. Empacamos toda esta información en nuestro formato de usuario de negocio.
    final appUser = AppUser(
      id: const Uuid()
          .v4(), // Generamos una identificación larga y única (UUID) para el teléfono
      firebaseUid: firebaseUser.uid,
      email: firebaseUser.email ?? '',
      displayName:
          firebaseUser.displayName ??
          firebaseUser.email?.split('@').first ??
          'Usuario',
      role: UserRole.fromString(role),
      isEmailVerified: firebaseUser.emailVerified,
      createdAt: DateTime.now(),
    );

    // 4. Guardamos este perfil en el celular para futuras aperturas de la app sin internet
    await localDatasource.upsertUser(appUser);
    return appUser;
  });

  /// [signIn] realiza todo el proceso de inicio de sesión:
  /// 1. Pide la validación al servidor (Firebase).
  /// 2. Obtiene el rol del usuario (Claims).
  /// 3. Busca si este usuario ya tenía una ID local o le genera una nueva.
  /// 4. Guarda la sesión en el teléfono y devuelve el perfil completo.
  @override
  Future<AppUser> signIn({
    required String email,
    required String password,
  }) async {
    String resolvedEmail = email;

    // Si no contiene '@', asumimos que es un nombre de usuario (displayName)
    if (!email.contains('@')) {
      // 1. Primero buscamos en la base de datos local (funciona sin internet/permisos)
      final localUser = await localDatasource.getUserByUsername(email);
      if (localUser != null) {
        resolvedEmail = localUser.email;
      } else {
        // 2. Si no está en local, intentamos Firestore
        try {
          final querySnapshot = await FirebaseFirestore.instance
              .collection('users')
              .where('displayName', isEqualTo: email)
              .limit(1)
              .get();
          if (querySnapshot.docs.isNotEmpty) {
            resolvedEmail = querySnapshot.docs.first.data()['email'] as String;
          } else {
            throw const AuthException('El nombre de usuario no está registrado.');
          }
        } catch (e) {
          if (e is AuthException) rethrow;
          throw AuthException('El nombre de usuario no está registrado o hubo un error: $e');
        }
      }
    }

    // 1. Iniciamos sesión en la nube
    final firebaseUser = await firebaseDatasource.signIn(
      email: resolvedEmail,
      password: password,
    );

    // 2. Obtenemos su rol administrativo o de cliente desde sus credenciales de Firebase
    final idTokenResult = await firebaseUser.getIdTokenResult();
    final role = idTokenResult.claims?['role'] as String? ?? 'client';

    // 3. Revisamos si el usuario ya tenía una ID local previa en este celular
    var localUser = await localDatasource.getCurrentUser();
    final String localId =
        (localUser != null && localUser.firebaseUid == firebaseUser.uid)
        ? localUser.id
        : const Uuid()
              .v4(); // Si es nuevo en este celular, le creamos una ID única

    // 4. Creamos el perfil de usuario completo
    final appUser = AppUser(
      id: localId,
      firebaseUid: firebaseUser.uid,
      email: firebaseUser.email ?? resolvedEmail,
      displayName: firebaseUser.displayName ?? resolvedEmail.split('@').first,
      role: UserRole.fromString(role),
      isEmailVerified: firebaseUser.emailVerified,
      createdAt: localUser?.createdAt ?? DateTime.now(),
    );

    // 5. Guardamos en la base de datos local SQLite para que funcione sin internet
    await localDatasource.upsertUser(appUser);
    return appUser;
  }

  /// [signUp] registra a un nuevo cliente en el sistema:
  /// 1. Registra el usuario en Firebase (en la nube).
  /// 2. Crea el perfil con Rol de Cliente (por defecto, los nuevos registros son clientes).
  /// 3. Guarda el registro localmente y lo devuelve.
  @override
  Future<AppUser> signUp({
    required String email,
    required String password,
    required String displayName,
  }) async {
    // 1. Registramos en la nube
    final firebaseUser = await firebaseDatasource.signUp(
      email: email,
      password: password,
      displayName: displayName,
    );

    // 2. Creamos la estructura del usuario
    final appUser = AppUser(
      id: const Uuid().v4(), // ID único local
      firebaseUid: firebaseUser.uid,
      email: firebaseUser.email ?? email,
      displayName: firebaseUser.displayName ?? displayName,
      role: UserRole
          .client, // Los nuevos registros siempre empiezan con rol de cliente normal
      isEmailVerified: firebaseUser.emailVerified,
      createdAt: DateTime.now(),
    );

    // 3. Guardamos localmente en SQLite
    await localDatasource.upsertUser(appUser);
    return appUser;
  }

  /// [getCurrentUser] busca quién está conectado.
  /// Primero busca en el teléfono para responder de inmediato.
  /// Si el teléfono está vacío pero hay sesión abierta en Firebase, recupera los datos de Firebase,
  /// los copia al teléfono y los devuelve.
  @override
  Future<AppUser?> getCurrentUser() async {
    // Intentamos buscarlo primero en la base de datos del teléfono (SQLite)
    final localUser = await localDatasource.getCurrentUser();
    if (localUser != null) return localUser;

    // Si no está en el teléfono, revisamos si la sesión sigue iniciada en Firebase
    final firebaseUser = firebaseDatasource.currentUser;
    if (firebaseUser == null) return null; // Nadie conectado en ningún lado

    // Si está conectado en Firebase pero no estaba guardado en SQLite (p. ej., se borró caché de la app):
    final idTokenResult = await firebaseUser.getIdTokenResult();
    final role = idTokenResult.claims?['role'] as String? ?? 'client';

    final appUser = AppUser(
      id: const Uuid().v4(),
      firebaseUid: firebaseUser.uid,
      email: firebaseUser.email ?? '',
      displayName:
          firebaseUser.displayName ??
          firebaseUser.email?.split('@').first ??
          'Usuario',
      role: UserRole.fromString(role),
      isEmailVerified: firebaseUser.emailVerified,
      createdAt: DateTime.now(),
    );

    // Lo guardamos localmente para no tener que hacer esta consulta de red la próxima vez
    await localDatasource.upsertUser(appUser);
    return appUser;
  }

  /// [signOut] cierra sesión por completo de forma coordinada:
  /// 1. Cierra la sesión en Firebase (Nube).
  /// 2. Borra los datos del usuario de la base de datos local SQLite (Celular) para seguridad.
  @override
  Future<void> signOut() async {
    await firebaseDatasource.signOut();
    await localDatasource.clearSession();
  }

  /// Envía un correo de recuperación al email indicado a través de Firebase.
  @override
  Future<void> sendPasswordResetEmail(String email) async {
    await firebaseDatasource.sendPasswordResetEmail(email);
  }
}
