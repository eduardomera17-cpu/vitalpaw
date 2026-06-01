import 'package:drift/drift.dart';
import '../database/app_database.dart';
import '../tables/orders_table.dart';
import '../tables/order_items_table.dart';

part 'orders_dao.g.dart';

@DriftAccessor(tables: [OrdersTable, OrderItemsTable])
class OrdersDao extends DatabaseAccessor<AppDatabase> with _$OrdersDaoMixin {
  OrdersDao(super.db);

  /// Carrito activo (status = 'cart') de un cliente.
  Stream<OrdersTableData?> watchCart(String clientId) {
    return (select(ordersTable)
          ..where((o) => o.clientId.equals(clientId))
          ..where((o) => o.status.equals('cart'))
          ..where((o) => o.deletedAt.isNull())
          ..limit(1))
        .watchSingleOrNull();
  }

  /// Obtener carrito activo (Future, no Stream).
  Future<OrdersTableData?> getActiveCart(String clientId) {
    return (select(ordersTable)
          ..where((o) => o.clientId.equals(clientId))
          ..where((o) => o.status.equals('cart'))
          ..where((o) => o.deletedAt.isNull())
          ..limit(1))
        .getSingleOrNull();
  }

  /// Items de un pedido (excluye soft-deleted).
  Stream<List<OrderItemsTableData>> watchItemsByOrder(String orderId) {
    return (select(orderItemsTable)
          ..where((i) => i.orderId.equals(orderId))
          ..where((i) => i.deletedAt.isNull()))
        .watch();
  }

  /// Items de un pedido (Future).
  Future<List<OrderItemsTableData>> getItemsByOrder(String orderId) {
    return (select(orderItemsTable)
          ..where((i) => i.orderId.equals(orderId))
          ..where((i) => i.deletedAt.isNull()))
        .get();
  }

  /// Obtener un item específico por ID.
  Future<OrderItemsTableData?> getItemById(String itemId) {
    return (select(orderItemsTable)
          ..where((i) => i.id.equals(itemId))
          ..where((i) => i.deletedAt.isNull()))
        .getSingleOrNull();
  }

  /// Pedidos de un cliente excluyendo carrito, ordenados por fecha.
  Stream<List<OrdersTableData>> watchOrdersByClient(String clientId) {
    return (select(ordersTable)
          ..where((o) => o.clientId.equals(clientId))
          ..where((o) => o.status.isNotValue('cart'))
          ..where((o) => o.deletedAt.isNull())
          ..orderBy([(o) => OrderingTerm.desc(o.placedAt)]))
        .watch();
  }

  /// Obtener pedido por ID.
  Future<OrdersTableData?> getOrderById(String orderId) {
    return (select(
      ordersTable,
    )..where((o) => o.id.equals(orderId))).getSingleOrNull();
  }

  /// Upsert de pedido.
  Future<void> upsertOrder(OrdersTableCompanion order) {
    return into(ordersTable).insertOnConflictUpdate(order);
  }

  /// Upsert de item de pedido.
  Future<void> upsertOrderItem(OrderItemsTableCompanion item) {
    return into(orderItemsTable).insertOnConflictUpdate(item);
  }

  /// Pendientes de sync (Orders)
  Future<List<OrdersTableData>> getPendingSync() {
    return (select(ordersTable)..where((o) => o.syncStatus.equals('pending'))).get();
  }

  /// Pendientes de sync (Items)
  Future<List<OrderItemsTableData>> getPendingItemsSync() {
    return (select(orderItemsTable)..where((i) => i.syncStatus.equals('pending'))).get();
  }

  /// Marcar como sincronizado (Order y Items comparten UUID en tablas distintas, pero SyncDispatcher usa IDs directos)
  Future<void> markSynced(String id) async {
    // Intentar actualizar en ambas tablas, ya que SyncDispatcher asume `markSynced` genérico
    await (update(ordersTable)..where((o) => o.id.equals(id)))
        .write(const OrdersTableCompanion(syncStatus: Value('synced')));
    
    await (update(orderItemsTable)..where((i) => i.id.equals(id)))
        .write(const OrderItemsTableCompanion(syncStatus: Value('synced')));
  }
}
