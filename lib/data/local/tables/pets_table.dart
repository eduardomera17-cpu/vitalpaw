import 'package:drift/drift.dart';
import 'users_table.dart';

// DEFINICIÓN DE LA TABLA DE MASCOTAS (TABLA DRIFT)
// Esta clase le dice a SQLite cómo estructurar el historial y perfil de cada mascota en la veterinaria.

class PetsTable extends Table {
  @override
  String get tableName => 'pets';

  // COLUMNAS DE LA TABLA

  /// Identificador único de la mascota (UUID largo generado en el teléfono).
  TextColumn get id => text()();

  /// Identificador del dueño de la mascota.
  /// '.references(UsersTable, #id)' crea una RELACIÓN (llave foránea).
  /// Esto le dice a la base de datos: "Esta mascota obligatoriamente pertenece a un usuario que existe en 'UsersTable'".
  TextColumn get ownerId => text().references(UsersTable, #id)();

  /// Nombre de la mascota (ej. "Toby", "Luna").
  TextColumn get name => text()();

  /// Especie de la mascota.
  /// Valores típicos: 'dog' (perro), 'cat' (gato), 'bird' (ave), 'rabbit' (conejo), 'fish' (pez), 'other' (otro).
  TextColumn get species => text()();

  /// Raza de la mascota (ej. "Husky", "Persa") - opcional.
  TextColumn get breed => text().nullable()();

  /// Género de la mascota.
  /// Valores: 'male' (macho), 'female' (hembra), 'unknown' (desconocido) - opcional.
  TextColumn get gender => text().nullable()();

  /// Fecha de nacimiento de la mascota (ayuda a calcular la edad exacta en las consultas).
  DateTimeColumn get birthDate => dateTime().nullable()();

  /// Peso en kilogramos de la mascota (valor decimal).
  RealColumn get weightKg => real().nullable()();

  /// Color o marcas particulares de la mascota para identificarla.
  TextColumn get colorDesc => text().nullable()();

  /// ¿La mascota está esterilizada/castrada? (por defecto es falso).
  BoolColumn get isNeutered => boolean().withDefault(const Constant(false))();

  /// ¿La mascota está a la venta? (por si la tienda tiene cachorritos autorizados).
  BoolColumn get isForSale => boolean().withDefault(const Constant(false))();

  /// ¿La mascota está disponible para adopción gratuita?
  BoolColumn get isForAdoption =>
      boolean().withDefault(const Constant(false))();

  /// Precio de venta (si aplica).
  RealColumn get salePrice => real().nullable()();

  /// Ruta donde se guarda la foto temporalmente en la memoria del celular.
  TextColumn get photoLocalPath => text().nullable()();

  /// Enlace de internet donde se guarda la foto de forma permanente en la nube (Firebase Storage).
  TextColumn get photoRemoteUrl => text().nullable()();

  /// Notas adicionales del veterinario o del dueño (alergias, comportamientos).
  TextColumn get notes => text().nullable()();

  // METADATOS DE SINCRONIZACIÓN (OBLIGATORIOS)
  // Ayudan a sincronizar esta mascota entre el teléfono y la nube sin chocar.

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  TextColumn get syncStatus => text().withDefault(const Constant('pending'))();
  IntColumn get syncVersion => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}
