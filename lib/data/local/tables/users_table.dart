import 'package:drift/drift.dart';

// DEFINICIÓN DE LA TABLA DE USUARIOS EN SQLITE (TABLA DRIFT)
// Esta clase le dice a la base de datos SQLite del teléfono cómo debe estructurar la información
// de los usuarios. Piensa en esto como definir las columnas de una hoja de Excel.

class UsersTable extends Table {
  // Le cambiamos el nombre técnico de la tabla a 'users' en SQLite.
  @override
  String get tableName => 'users';

  // COLUMNAS DE LA TABLA

  /// Identificador único del usuario (usamos UUID, un texto largo único generado localmente).
  TextColumn get id => text()();

  /// El código identificador que Firebase le asigna a este usuario en la nube (puede ser nulo).
  TextColumn get firebaseUid => text().unique().nullable()();

  /// Correo electrónico único del usuario. No puede haber dos usuarios con el mismo correo.
  TextColumn get email => text().unique()();

  /// El nombre completo del usuario para mostrar en la interfaz.
  TextColumn get displayName => text()();

  /// Enlace o URL de la foto de perfil del usuario (opcional).
  TextColumn get photoUrl => text().nullable()();

  /// El rol del usuario dentro de la tienda (por defecto es 'client').
  /// Los valores posibles son: 'admin' (administrador), 'staff' (vendedor/veterinario),
  /// 'client' (dueño de mascota) o 'driver' (repartidor).
  TextColumn get role => text().withDefault(const Constant('client'))();

  /// Indica si el usuario ya validó su correo electrónico (por defecto es falso).
  BoolColumn get isEmailVerified =>
      boolean().withDefault(const Constant(false))();

  /// Indica si el usuario está activo (por defecto es verdadero).
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();

  /// Número telefónico de contacto del usuario (opcional).
  TextColumn get phoneNumber => text().nullable()();

  // METADATOS DE SINCRONIZACIÓN (OBLIGATORIOS PARA MANTENER LA APP EN LÍNEA/DESCONECTADA)
  // Estas columnas no las ve el usuario, pero son los "engranajes" que permiten
  // sincronizar el teléfono local con los servidores de internet (Firestore).

  /// Fecha y hora exacta de creación del usuario.
  DateTimeColumn get createdAt => dateTime()();

  /// Fecha y hora de la última modificación de los datos. Ayuda a saber qué dato es más reciente.
  DateTimeColumn get updatedAt => dateTime()();

  /// Fecha de eliminación lógica. Si el usuario "se borra", en realidad guardamos aquí la fecha
  /// en lugar de borrar la fila de inmediato, para poder avisarle al servidor que debe borrarlo también.
  DateTimeColumn get deletedAt => dateTime().nullable()();

  /// Estado de sincronización actual. Valores posibles:
  /// - 'pending': El dato se creó/editó sin internet y está esperando ser subido al servidor.
  /// - 'synced': El dato ya está perfectamente guardado y actualizado tanto en el teléfono como en internet.
  TextColumn get syncStatus => text().withDefault(const Constant('pending'))();

  /// El número de versión del registro. Cada vez que se actualiza en internet, aumenta en 1.
  /// Evita que datos viejos del teléfono sobrescriban datos nuevos del servidor (Estrategia LWW).
  IntColumn get syncVersion => integer().withDefault(const Constant(0))();

  // Indicamos que la columna 'id' es la Llave Primaria. Es el dato único que identifica a esta fila.
  @override
  Set<Column> get primaryKey => {id};
}
