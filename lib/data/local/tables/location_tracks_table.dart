import 'package:drift/drift.dart';
import 'users_table.dart';
import 'orders_table.dart';

// DEFINICIÓN DE LA TABLA DE RASTREO GPS (TABLA DRIFT)
// Esta clase le dice a SQLite cómo estructurar las coordenadas de GPS de los repartidores.
// Permite rastrear la ubicación del repartidor mientras lleva una entrega para que el cliente
// la pueda ver en tiempo real en un mapa.
//
// ⚠️ REGLA DE ORO (APPEND-ONLY):
// Esta tabla es de solo-escritura (Append-Only). NUNCA se actualiza ni borra un punto GPS viejo.
// Simplemente se van guardando nuevos puntos GPS a medida que el chofer avanza por la calle.
// En Firestore, esto se guarda en una subcolección: /orders/{orderId}/tracking/{trackingId}

class LocationTracksTable extends Table {
  @override
  String get tableName => 'location_tracks';

  // COLUMNAS DE LA TABLA

  /// Identificador único del punto GPS (UUID largo).
  TextColumn get id => text()();

  /// El repartidor o chofer que está generando la ubicación.
  /// Relaciona con la tabla 'UsersTable'.
  TextColumn get driverId => text().references(UsersTable, #id)();

  /// El pedido que se está entregando en esta ruta.
  /// Relaciona con la tabla 'OrdersTable'.
  TextColumn get orderId => text().references(OrdersTable, #id)();

  /// Coordenada GPS de Latitud.
  RealColumn get latitude => real()();

  /// Coordenada GPS de Longitud.
  RealColumn get longitude => real()();

  /// Nivel de precisión del satélite GPS del teléfono en metros (opcional).
  /// (ej. si el margen de error es de 5 metros o de 50 metros).
  RealColumn get accuracyMeters => real().nullable()();

  /// Velocidad en kilómetros por hora a la que se mueve el chofer (opcional).
  RealColumn get speedKmh => real().nullable()();

  /// Dirección o rumbo del celular en grados (de 0 a 360, ej. 90 es el Este) - opcional.
  /// Sirve para rotar el icono del carrito en el mapa.
  RealColumn get headingDegrees => real().nullable()();

  /// La fecha y hora exacta en la que el sensor de GPS detectó la ubicación en el teléfono.
  /// Se registra por separado porque si el teléfono no tiene internet, puede capturar la ubicación
  /// y guardarla aquí, y el 'createdAt' se llenará después cuando se suba a la base de datos.
  DateTimeColumn get recordedAt => dateTime()();

  // METADATOS DE SINCRONIZACIÓN (OBLIGATORIOS)
  // Permiten acumular coordenadas GPS de forma desconectada y subirlas en lote (Batch) cuando regrese el internet.

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  TextColumn get syncStatus => text().withDefault(const Constant('pending'))();
  IntColumn get syncVersion => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}
