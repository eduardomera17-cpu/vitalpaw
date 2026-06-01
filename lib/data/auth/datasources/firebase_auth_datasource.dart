import 'package:firebase_auth/firebase_auth.dart';
import '../../../domain/auth/entities/auth_exception.dart';

// FUENTE DE DATOS DE FIREBASE (DATASOURCE REMOTO)
// En arquitectura de software, un "Datasource" es el responsable directo de comunicarse
// con un servicio externo (en este caso, los servidores de Google Firebase en la nube).
// Aquí no hay lógica del negocio de mascotas, solo llamadas directas de red para iniciar sesión o registrar cuentas.

class FirebaseAuthDatasource {
  // La herramienta oficial de Google que se conecta con la nube para autenticar usuarios.
  final FirebaseAuth _firebaseAuth;

  // Si al crear esta clase no le pasamos un FirebaseAuth personalizado (útil en pruebas/tests),
  // por defecto toma la conexión real de la app usando 'FirebaseAuth.instance'.
  FirebaseAuthDatasource({FirebaseAuth? firebaseAuth})
    : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  /// Devuelve los datos básicos del usuario que tiene iniciada la sesión actualmente en Firebase.
  /// Devuelve 'null' si no hay nadie conectado.
  User? get currentUser => _firebaseAuth.currentUser;

  /// Un canal de datos (Stream) que nos notifica instantáneamente cuando el estado de la sesión cambia
  /// (por ejemplo, si el usuario pasa de desconectado a conectado, o si cierra sesión).
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  /// Inicia sesión en Firebase usando correo y contraseña.
  ///
  /// Si el inicio es correcto, devuelve el usuario de Firebase.
  /// Si falla (por ejemplo, clave incorrecta o falta de internet), captura el error técnico
  /// y lanza una [AuthException] traducida en español.
  Future<User> signIn({required String email, required String password}) async {
    try {
      // Intentamos iniciar sesión con la librería oficial
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Si por alguna razón Firebase no devuelve un usuario válido, lanzamos error manual
      if (credential.user == null) {
        throw const AuthException(
          'No se pudo obtener el perfil del usuario desde el servidor.',
        );
      }

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      // Capturamos errores específicos de Firebase (clave incorrecta, usuario no existe) y los traducimos
      throw AuthException.fromFirebaseCode(e.code);
    } catch (e) {
      // Cualquier otro error inesperado (como problemas de memoria o código)
      throw AuthException(
        'Ocurrió un error inesperado al intentar ingresar: $e',
      );
    }
  }

  /// Crea una nueva cuenta de usuario en los servidores de Firebase.
  ///
  /// Después de crearla con éxito, le asigna su nombre completo para mostrar ([displayName]).
  Future<User> signUp({
    required String email,
    required String password,
    required String displayName,
  }) async {
    try {
      // Creamos la cuenta con correo y contraseña en la nube
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user == null) {
        throw const AuthException(
          'No se pudo registrar la cuenta en el servidor.',
        );
      }

      // Asignamos el nombre del usuario a su perfil de Firebase
      await credential.user!.updateDisplayName(displayName);

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      // Si el correo ya existe, por ejemplo, aquí se captura y se traduce al español
      throw AuthException.fromFirebaseCode(e.code);
    } catch (e) {
      throw AuthException(
        'Ocurrió un error inesperado al registrar el usuario: $e',
      );
    }
  }

  /// Cierra la sesión activa en el servidor de Firebase.
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  /// Le pide a Firebase que envíe un correo de recuperación de contraseña.
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromFirebaseCode(e.code);
    } catch (e) {
      throw AuthException(
        'Error inesperado al enviar el correo de recuperación: $e',
      );
    }
  }
}
