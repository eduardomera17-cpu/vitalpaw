import 'package:drift/drift.dart';
import 'orders_table.dart';
import 'products_table.dart';

// DEFINICIÓN DE LOS RENGLONES DE LA COMPRA (TABLA DRIFT)
// Esta clase representa los "detalles" o "renglones" de una factura de compra.
// Cada fila representa un producto específico dentro de un pedido principal.
//
// En internet, esto se guarda como una subcolección en la ruta: /orders/{orderId}/items/{itemId}

class OrderItemsTable extends Table {
  @override
  String get tableName => 'order_items';

  // COLUMNAS DE LA TABLA

  /// Identificador único de este renglón (UUID largo).
  TextColumn get id => text()();

  /// El pedido principal al que pertenece este renglón.
  /// Relaciona con la tabla 'OrdersTable'.
  TextColumn get orderId => text().references(OrdersTable, #id)();

  /// El producto comprado.
  /// Relaciona con la tabla 'ProductsTable'.
  TextColumn get productId => text().references(ProductsTable, #id)();

  /// Cantidad de piezas de este producto que está comprando el cliente.
  IntColumn get quantity => integer()();

  /// Precio unitario cobrado por este producto al momento de la compra.
  /// Nota: Se guarda el precio exacto congelado en ese instante, por si el producto sube o baja de precio
  /// en el catálogo general mañana, no afecte la factura histórica del cliente.
  RealColumn get unitPrice => real()();

  /// Subtotal acumulado de este producto específico (quantity * unitPrice).
  RealColumn get subtotal => real()();

  /// Captura de datos del producto al momento del pedido.
  /// Se guarda como un texto en JSON (nombre, marca, imagen).
  /// Esto sirve como un respaldo histórico por si el producto llega a eliminarse del catálogo en el futuro.
  TextColumn get productSnapshot => text().nullable()();

  // METADATOS DE SINCRONIZACIÓN (OBLIGATORIOS)
  // Garantizan que cada renglón del pedido se suba a la nube conectado correctamente a su pedido padre.

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  TextColumn get syncStatus => text().withDefault(const Constant('pending'))();
  IntColumn get syncVersion => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}
