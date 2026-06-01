import 'package:drift/drift.dart';
import 'users_table.dart';

// DEFINICIÓN DE LA TABLA DE PEDIDOS (TABLA DRIFT)
// Esta clase le dice a SQLite cómo estructurar el registro de compras de la tienda.
// Controla el carrito de compras, los montos a pagar y la información de envíos a domicilio.

class OrdersTable extends Table {
  @override
  String get tableName => 'orders';

  // COLUMNAS DE LA TABLA

  /// Identificador único del pedido (UUID largo).
  TextColumn get id => text()();

  /// El cliente que realizó la compra.
  /// Relaciona con la tabla 'UsersTable'.
  TextColumn get clientId => text().references(UsersTable, #id)();

  /// El repartidor o chofer asignado para llevar el pedido (puede ser nulo si se retira en tienda).
  /// Relaciona con la tabla 'UsersTable'.
  TextColumn get driverId => text().references(UsersTable, #id).nullable()();

  /// Estado de progreso del pedido (por defecto 'cart', o sea, en el carrito).
  /// Valores posibles:
  /// - 'cart' (en el carrito), 'placed' (pedido enviado), 'confirmed' (aceptado por la tienda),
  /// - 'preparing' (preparando productos), 'ready' (listo para despacho), 'delivering' (en camino),
  /// - 'delivered' (entregado al cliente), 'cancelled' (cancelado).
  TextColumn get status => text().withDefault(const Constant('cart'))();

  /// Costo acumulado de los productos sin contar el envío (por defecto 0.0).
  RealColumn get subtotal => real().withDefault(const Constant(0.0))();

  /// Costo del envío a domicilio cobrado al cliente (por defecto 0.0).
  RealColumn get deliveryFee => real().withDefault(const Constant(0.0))();

  /// Monto total final a pagar (subtotal + deliveryFee).
  RealColumn get totalAmount => real().withDefault(const Constant(0.0))();

  /// Dirección de calle y número escrita por el cliente para el reparto (opcional).
  TextColumn get deliveryAddress => text().nullable()();

  /// Latitud de la dirección (coordenada GPS) para mostrarla en el mapa del repartidor.
  RealColumn get deliveryLat => real().nullable()();

  /// Longitud de la dirección (coordenada GPS) para el mapa.
  RealColumn get deliveryLng => real().nullable()();

  /// Método de pago seleccionado por el cliente.
  /// Valores: 'cash' (efectivo), 'card' (tarjeta física), 'transfer' (transferencia), 'online' (pago web).
  TextColumn get paymentMethod => text().nullable()();

  /// Estado del pago del pedido (por defecto 'pending' - pendiente).
  /// Valores: 'pending' (pendiente), 'paid' (pagado), 'refunded' (reembolsado).
  TextColumn get paymentStatus =>
      text().withDefault(const Constant('pending'))();

  /// Notas aclaratorias que deje el cliente (ej. "Tocar el timbre verde", "Dejar en recepción").
  TextColumn get clientNotes => text().nullable()();

  /// Fecha y hora exacta en la que el cliente confirmó su compra y mandó el pedido a la tienda.
  DateTimeColumn get placedAt => dateTime().nullable()();

  /// Fecha y hora exacta en la que el repartidor entregó el paquete al cliente.
  DateTimeColumn get deliveredAt => dateTime().nullable()();

  // METADATOS DE SINCRONIZACIÓN (OBLIGATORIOS)
  // Permiten hacer pedidos offline (ej. en zonas sin señal) y subirlos automáticamente al recuperar señal.

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  TextColumn get syncStatus => text().withDefault(const Constant('pending'))();
  IntColumn get syncVersion => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}
