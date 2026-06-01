// lib/data/marketplace/order_repository_impl.dart

import 'dart:convert';
import 'package:drift/drift.dart';

import '../../domain/marketplace/entities/marketplace_exception.dart';
import '../../domain/marketplace/entities/order.dart';
import '../../domain/marketplace/entities/cart_item.dart';
import '../../domain/marketplace/repositories/order_repository.dart';
import '../local/daos/orders_dao.dart';
import '../local/daos/products_dao.dart';
import '../local/database/app_database.dart';
import 'mappers/marketplace_mappers.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrdersDao _ordersDao;
  final ProductsDao _productsDao;

  OrderRepositoryImpl(this._ordersDao, this._productsDao);

  @override
  Stream<List<Order>> watchOrderHistory(String clientId) => _ordersDao
      .watchOrdersByClient(clientId)
      .map(
        (rows) => rows
            .map((row) => MarketplaceMappers.orderFromData(row, []))
            .toList(),
      );

  @override
  Future<Order?> getOrderWithItems(String orderId) async {
    final order = await _ordersDao.getOrderById(orderId);
    if (order == null) return null;

    final itemRows = await _ordersDao.getItemsByOrder(orderId);
    final items = itemRows.map((row) {
      Map<String, dynamic>? snapshot;
      if (row.productSnapshot != null) {
        snapshot = jsonDecode(row.productSnapshot!) as Map<String, dynamic>;
      }
      return CartItem(
        id: row.id,
        orderId: row.orderId,
        productId: row.productId,
        productName: snapshot?['name'] ?? 'Producto',
        productImageUrl: snapshot?['imageUrl'] as String?,
        unitPrice: row.unitPrice,
        quantity: row.quantity,
      );
    }).toList();

    return MarketplaceMappers.orderFromData(order, items);
  }

  @override
  Future<Order> placeOrder(PlaceOrderParams params) async {
    final now = DateTime.now();

    // 1. Obtener carrito activo
    final cart = await _ordersDao.getActiveCart(params.clientId);
    if (cart == null) {
      throw const EmptyCartException();
    }

    // 2. Obtener items del carrito
    final items = await _ordersDao.getItemsByOrder(cart.id);
    if (items.isEmpty) {
      throw const EmptyCartException();
    }

    // 3. Verificar stock de TODOS los items antes de confirmar
    for (final item in items) {
      // FIX: Obtener producto directamente por ID
      final product = await _productsDao.getById(item.productId);

      if (product == null) {
        throw ProductNotFoundException(item.productId);
      }

      if (product.stockQty < item.quantity) {
        // FIX: Usar nombre real del producto, no el productId
        throw InsufficientStockException(
          productId: item.productId,
          productName: product.name,
          available: product.stockQty,
          requested: item.quantity,
        );
      }
    }

    // 4. Decrementar stock (offline-first: en Drift primero)
    for (final item in items) {
      final success = await _productsDao.decrementStock(
        item.productId,
        item.quantity,
      );
      if (!success) {
        // Revertir decrementos anteriores si falla a mitad de camino
        for (final prevItem in items.takeWhile((i) => i.id != item.id)) {
          await _productsDao.restoreStock(
            prevItem.productId,
            prevItem.quantity,
          );
        }
        final product = await _productsDao.getById(item.productId);
        throw InsufficientStockException(
          productId: item.productId,
          productName: product?.name ?? 'Desconocido',
          available: product?.stockQty ?? 0,
          requested: item.quantity,
        );
      }
    }

    // 5. Transicionar el pedido de 'cart' a 'placed'
    final subtotal = items.fold<double>(0, (s, i) => s + i.subtotal);
    final total = subtotal + params.deliveryFee;

    await _ordersDao.upsertOrder(
      OrdersTableCompanion(
        id: Value(cart.id),
        status: const Value('placed'),
        subtotal: Value(subtotal),
        deliveryAddress: Value(params.deliveryAddress),
        deliveryLat: Value(params.deliveryLat),
        deliveryLng: Value(params.deliveryLng),
        deliveryFee: Value(params.deliveryFee),
        totalAmount: Value(total),
        paymentMethod: Value(params.paymentMethod.name),
        clientNotes: Value(params.clientNotes),
        placedAt: Value(now),
        updatedAt: Value(now),
        syncStatus: const Value('pending'),
        syncVersion: Value(cart.syncVersion + 1),
      ),
    );

    // 6. Construir entidad de retorno
    final cartItems = items.map((row) {
      Map<String, dynamic>? snapshot;
      if (row.productSnapshot != null) {
        snapshot = jsonDecode(row.productSnapshot!) as Map<String, dynamic>;
      }
      return CartItem(
        id: row.id,
        orderId: cart.id,
        productId: row.productId,
        productName: snapshot?['name'] ?? 'Producto',
        productImageUrl: snapshot?['imageUrl'] as String?,
        unitPrice: row.unitPrice,
        quantity: row.quantity,
      );
    }).toList();

    return Order(
      id: cart.id,
      clientId: params.clientId,
      status: OrderStatus.placed,
      items: cartItems,
      subtotal: subtotal,
      deliveryFee: params.deliveryFee,
      totalAmount: total,
      deliveryAddress: params.deliveryAddress,
      deliveryLat: params.deliveryLat,
      deliveryLng: params.deliveryLng,
      paymentMethod: params.paymentMethod,
      clientNotes: params.clientNotes,
      placedAt: now,
      createdAt: cart.createdAt,
      updatedAt: now,
    );
  }

  @override
  Future<void> cancelOrder(String orderId) async {
    final order = await _ordersDao.getOrderById(orderId);
    if (order == null) return;

    final status = OrderStatus.fromString(order.status);

    // Validar que el pedido puede ser cancelado
    if (status != OrderStatus.placed && status != OrderStatus.confirmed) {
      throw OrderNotCancellableException(
        orderId: orderId,
        currentStatus: status,
      );
    }

    // FIX: Usar restoreStock (método específico) en vez de decrementStock negativo
    final items = await _ordersDao.getItemsByOrder(orderId);
    for (final item in items) {
      await _productsDao.restoreStock(item.productId, item.quantity);
    }

    await _ordersDao.upsertOrder(
      OrdersTableCompanion(
        id: Value(orderId),
        status: const Value('cancelled'),
        updatedAt: Value(DateTime.now()),
        syncStatus: const Value('pending'),
        syncVersion: Value(order.syncVersion + 1),
      ),
    );
  }
}
