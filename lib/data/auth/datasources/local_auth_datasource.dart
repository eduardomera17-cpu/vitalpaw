import 'package:drift/drift.dart';
import '../../local/database/app_database.dart';
import '../../../domain/auth/entities/app_user.dart';

// FUENTE DE DATOS LOCAL DE USUARIOS (DATASOURCE LOCAL)
// Este archivo se encarga de guardar y leer la información del usuario conectado directamente
// en el teléfono usando la base de datos SQLite (con Drift).
// Esto permite que el usuario pueda abrir la aplicación y ver su perfil incluso si no tiene internet.

class LocalAuthDatasource {
  // La conexión a nuestra base de datos SQLite local
  final AppDatabase _db;

  LocalAuthDatasource(this._db);

  /// Guarda o actualiza el usuario actual en la base de datos interna del teléfono.
  ///
  /// Usamos 'UsersTableCompanion' que es una clase generada por Drift.
  /// Piensa en el 'Companion' como un "formulario pre-llenado" que le enviamos a la base de datos.
  Future<void> upsertUser(AppUser user) async {
    final companion = UsersTableCompanion(
      id: Value(user.id),
      firebaseUid: Value(user.firebaseUid),
      email: Value(user.email),
      displayName: Value(user.displayName),
      role: Value(user.role.name),
      isEmailVerified: Value(user.isEmailVerified),
      createdAt: Value(user.createdAt),
      // Colocamos que fue actualizado en este preciso instante
      updatedAt: Value(DateTime.now()),
    );

    // 'insertOnConflictUpdate' es muy inteligente:
    // Si el usuario no existe en el teléfono, lo crea.
    // Si ya existe (mismo ID), actualiza sus datos en lugar de dar error.
    await _db.into(_db.usersTable).insertOnConflictUpdate(companion);
  }

  /// Obtiene los datos del usuario conectado que están guardados en el teléfono.
  ///
  /// Devuelve el perfil completo ([AppUser]) o 'null' si no hay nadie guardado localmente.
  Future<AppUser?> getCurrentUser() async {
    // Hacemos una consulta a la tabla de usuarios local pidiéndole el primero que encuentre (limit(1))
    final userRow = await (_db.select(
      _db.usersTable,
    )..limit(1)).getSingleOrNull();

    // Si no encontramos ningún registro, significa que no hay sesión iniciada localmente
    if (userRow == null) return null;

    // Convertimos la fila plana de la base de datos SQLite en nuestro objeto limpio de negocio (AppUser)
    return AppUser(
      id: userRow.id,
      firebaseUid: userRow.firebaseUid ?? '',
      email: userRow.email,
      displayName: userRow.displayName,
      role: UserRole.fromString(userRow.role),
      isEmailVerified: userRow.isEmailVerified,
      createdAt: userRow.createdAt,
    );
  }

  /// Busca un usuario por su nombre de usuario (displayName) en la base de datos local.
  Future<AppUser?> getUserByUsername(String username) async {
    final userRow = await (_db.select(_db.usersTable)
      ..where((t) => t.displayName.equals(username))
      ..limit(1))
      .getSingleOrNull();

    if (userRow == null) return null;

    return AppUser(
      id: userRow.id,
      firebaseUid: userRow.firebaseUid ?? '',
      email: userRow.email,
      displayName: userRow.displayName,
      role: UserRole.fromString(userRow.role),
      isEmailVerified: userRow.isEmailVerified,
      createdAt: userRow.createdAt,
    );
  }

  /// Elimina por completo los datos del usuario de la base de datos local.
  /// Se ejecuta al cerrar sesión para garantizar la privacidad y seguridad de la cuenta.
  Future<void> clearSession() async {
    // Borra todas las filas que existan en la tabla de usuarios local
    await _db.delete(_db.usersTable).go();
  }
}
