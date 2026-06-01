import 'package:drift/drift.dart';
import '../database/app_database.dart';
import '../tables/users_table.dart';

// Este archivo es una plantilla para autogenerar el código SQL pesado de acceso a datos.
part 'users_dao.g.dart';

// CAJERO ESPECÍFICO DE USUARIOS (USERS DAO)
// En arquitectura de software, un DAO es un "Objeto de Acceso a Datos".
// Piensa en él como un cajero de banco especializado en una sola ventanilla.
// En lugar de hacer consultas SQL complejas en toda la app, le pedimos a este "cajero" que haga
// las operaciones específicas sobre la tabla de usuarios de forma ordenada.

@DriftAccessor(tables: [UsersTable])
class UsersDao extends DatabaseAccessor<AppDatabase> with _$UsersDaoMixin {
  UsersDao(super.db);

  /// Guarda o actualiza un usuario en el teléfono (Operación Upsert).
  ///
  /// Si el usuario es nuevo, lo inserta. Si ya existe, actualiza sus campos.
  Future<void> upsertUser(UsersTableCompanion user) =>
      into(db.usersTable).insertOnConflictUpdate(user);

  /// Busca un usuario en la base de datos local usando su [id] único.
  ///
  /// Filtra automáticamente para excluir usuarios que hayan sido eliminados lógicamente ('deletedAt.isNull()').
  Future<UsersTableData?> getUserById(String id) => (select(
    db.usersTable,
  )..where((t) => t.id.equals(id) & t.deletedAt.isNull())).getSingleOrNull();

  /// Busca un usuario en la base de datos local usando su [uid] de Firebase.
  /// Excluye usuarios eliminados.
  Future<UsersTableData?> getUserByFirebaseUid(String uid) =>
      (select(db.usersTable)
            ..where((t) => t.firebaseUid.equals(uid) & t.deletedAt.isNull()))
          .getSingleOrNull();

  /// Mantiene una vigilancia activa (Stream) sobre los datos del usuario conectado.
  ///
  /// Si el usuario cambia su nombre o foto, este Stream se dispara y actualiza
  /// la pantalla del celular automáticamente en tiempo real (Reactividad).
  Stream<UsersTableData?> watchCurrentUser(String firebaseUid) =>
      (select(db.usersTable)..where(
            (t) => t.firebaseUid.equals(firebaseUid) & t.deletedAt.isNull(),
          ))
          .watchSingleOrNull();

  /// Obtiene la lista de todos los usuarios cuyos cambios locales aún no se han subido a internet.
  ///
  /// Es usado por el motor de sincronización automática al recuperar la conexión.
  Future<List<UsersTableData>> getPendingSync() => (select(
    db.usersTable,
  )..where((t) => t.syncStatus.equals('pending'))).get();

  /// Marca que los cambios de un usuario ya se subieron exitosamente a la nube de internet.
  ///
  /// Actualiza su estado de sincronización a 'synced'.
  Future<void> markSynced(String id) =>
      (update(db.usersTable)..where((t) => t.id.equals(id))).write(
        UsersTableCompanion(
          syncStatus: const Value('synced'),
          updatedAt: Value(DateTime.now()),
        ),
      );

  /// Realiza una eliminación "lógica" o "suave" (Soft Delete).
  ///
  /// En lugar de borrar la fila físicamente del celular (lo que impediría avisarle al servidor
  /// en internet que debe borrarse), simplemente le colocamos la fecha actual en 'deletedAt'
  /// y marcamos el estado en 'pending' para que el motor de sincronización lo borre en la nube después.
  Future<void> softDeleteUser(String id) =>
      (update(db.usersTable)..where((t) => t.id.equals(id))).write(
        UsersTableCompanion(
          deletedAt: Value(DateTime.now()),
          updatedAt: Value(DateTime.now()),
          syncStatus: const Value('pending'),
        ),
      );
}
