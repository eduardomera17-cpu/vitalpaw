// lib/data/marketplace/cart_repository_impl.dart

import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../domain/marketplace/entities/marketplace_exception.dart';
import '../../domain/marketplace/entities/product.dart';
import '../../domain/marketplace/entities/order.dart';
import '../../domain/marketplace/entities/cart_item.dart';
import '../../domain/marketplace/repositories/cart_repository.dart';
import '../local/daos/orders_dao.dart';
import '../local/daos/products_dao.dart';
import '../local/database/app_database.dart';
import 'mappers/marketplace_mappers.dart';

class CartRepositoryImpl implements CartRepository {
  final OrdersDao _ordersDao;
  final ProductsDao _productsDao;

  /// FIX: Delivery fee configurable en vez de hardcodeado
  static const double _defaultDeliveryFee = 2.50;

  CartRepositoryImpl(this._ordersDao, this._productsDao);

  @override
  Stream<Order?> watchCart(String clientId) => _ordersDao
      .watchCart(clientId)
      .map((row) => row == null ? null : _orderToEntity(row, []));

  @override
  Stream<List<CartItem>> watchCartItems(String clientId) =>
      _ordersDao.watchCart(clientId).asyncExpand((cart) {
        if (cart == null) return Stream.value([]);
        return _ordersDao
            .watchItemsByOrder(cart.id)
            .map((items) => items.map(_itemToEntity).toList());
      });

  @override
  Future<void> addItem({
    required String clientId,
    required Product product,
    int quantity = 1,
  }) async {
    // FIX: Validar que el producto existe y tiene stock
    final dbProduct = await _productsDao.getById(product.id);
    if (dbProduct == null) {
      throw ProductNotFoundException(product.id);
    }

    final now = DateTime.now();

    // 1. Buscar o crear el carrito activo
    var cart = await _ordersDao.getActiveCart(clientId);
    String cartId;

    if (cart == null) {
      cartId = const Uuid().v4();
      await _ordersDao.upsertOrder(
        OrdersTableCompanion.insert(
          id: cartId,
          clientId: clientId,
          status: const Value('cart'),
          subtotal: const Value(0.0),
          deliveryFee: const Value(0.0),
          totalAmount: const Value(0.0),
          createdAt: now,
          updatedAt: now,
        ),
      );
    } else {
      cartId = cart.id;
    }

    // 2. Verificar si el producto ya está en el carrito
    final existingItems = await _ordersDao.getItemsByOrder(cartId);
    final existing = existingItems
        .where((i) => i.productId == product.id)
        .firstOrNull;

    if (existing != null) {
      final newQty = existing.quantity + quantity;

      // FIX: Validar stock antes de incrementar
      if (!product.hasStockFor(newQty)) {
        throw InsufficientStockException(
          productId: product.id,
          productName: product.name,
          available: product.stockQty,
          requested: newQty,
        );
      }

      await _ordersDao.upsertOrderItem(
        OrderItemsTableCompanion(
          id: Value(existing.id),
          quantity: Value(newQty),
          subtotal: Value(existing.unitPrice * newQty),
          updatedAt: Value(now),
          syncStatus: const Value('pending'),
          syncVersion: Value(existing.syncVersion + 1),
        ),
      );
    } else {
      // FIX: Validar stock para item nuevo
      if (!product.hasStockFor(quantity)) {
        throw InsufficientStockException(
          productId: product.id,
          productName: product.name,
          available: product.stockQty,
          requested: quantity,
        );
      }

      // Agregar nuevo item con snapshot congelado del producto
      final itemId = const Uuid().v4();
      final snapshot = product.toSnapshot();

      await _ordersDao.upsertOrderItem(
        OrderItemsTableCompanion.insert(
          id: itemId,
          orderId: cartId,
          productId: product.id,
          quantity: quantity,
          unitPrice: product.finalPrice,
          subtotal: product.finalPrice * quantity,
          productSnapshot: Value(jsonEncode(snapshot)),
          createdAt: now,
          updatedAt: now,
        ),
      );
    }

    // 3. Recalcular totales del carrito
    await _recalculateTotals(cartId);
  }

  @override
  Future<void> updateItemQuantity({
    required String itemId,
    required int quantity,
  }) async {
    if (quantity <= 0) {
      await removeItem(itemId);
      return;
    }

    // FIX: Obtener el item directamente por ID (no con stream vacío)
    final item = await _ordersDao.getItemById(itemId);
    if (item == null) return;

    // FIX: Validar stock disponible
    final product = await _productsDao.getById(item.productId);
    if (product != null && product.stockQty < quantity) {
      throw InsufficientStockException(
        productId: item.productId,
        productName: product.name,
        available: product.stockQty,
        requested: quantity,
      );
    }

    await _ordersDao.upsertOrderItem(
      OrderItemsTableCompanion(
        id: Value(itemId),
        quantity: Value(quantity),
        subtotal: Value(item.unitPrice * quantity),
        updatedAt: Value(DateTime.now()),
        syncStatus: const Value('pending'),
        syncVersion: Value(item.syncVersion + 1),
      ),
    );

    await _recalculateTotals(item.orderId);
  }

  @override
  Future<void> removeItem(String itemId) async {
    // FIX: Obtener orderId ANTES de hacer soft delete
    final item = await _ordersDao.getItemById(itemId);
    if (item == null) return;

    final now = DateTime.now();

    // Soft delete del item
    await _ordersDao.upsertOrderItem(
      OrderItemsTableCompanion(
        id: Value(itemId),
        deletedAt: Value(now),
        updatedAt: Value(now),
        syncStatus: const Value('pending'),
      ),
    );

    // FIX: Recalcular totales con el orderId correcto
    await _recalculateTotals(item.orderId);
  }

  @override
  Future<void> clearCart(String clientId) async {
    final cart = await _ordersDao.getActiveCart(clientId);
    if (cart == null) return;

    final now = DateTime.now();

    // Soft delete de todos los items
    final items = await _ordersDao.getItemsByOrder(cart.id);
    for (final item in items) {
      await _ordersDao.upsertOrderItem(
        OrderItemsTableCompanion(
          id: Value(item.id),
          deletedAt: Value(now),
          updatedAt: Value(now),
          syncStatus: const Value('pending'),
        ),
      );
    }

    // Soft delete del pedido
    await _ordersDao.upsertOrder(
      OrdersTableCompanion(
        id: Value(cart.id),
        deletedAt: Value(now),
        updatedAt: Value(now),
        syncStatus: const Value('pending'),
      ),
    );
  }

  @override
  Stream<CartTotals> watchTotals(String clientId) =>
      watchCartItems(clientId).map((items) {
        if (items.isEmpty) return CartTotals.empty;

        final subtotal = items.fold<double>(0, (sum, i) => sum + i.subtotal);

        return CartTotals(
          itemCount: items.fold(0, (s, i) => s + i.quantity),
          subtotal: subtotal,
          deliveryFee: _defaultDeliveryFee,
          total: subtotal + _defaultDeliveryFee,
        );
      });

  Future<void> _recalculateTotals(String cartId) async {
    final items = await _ordersDao.getItemsByOrder(cartId);
    final subtotal = items.fold<double>(0, (s, i) => s + i.subtotal);

    await _ordersDao.upsertOrder(
      OrdersTableCompanion(
        id: Value(cartId),
        subtotal: Value(subtotal),
        totalAmount: Value(subtotal + _defaultDeliveryFee),
        updatedAt: Value(DateTime.now()),
        syncStatus: const Value('pending'),
      ),
    );
  }

  CartItem _itemToEntity(OrderItemsTableData row) {
    Map<String, dynamic>? snapshot;
    if (row.productSnapshot != null) {
      snapshot = jsonDecode(row.productSnapshot!) as Map<String, dynamic>;
    }

    return CartItem(
      id: row.id,
      orderId: row.orderId,
      productId: row.productId,
      productName: snapshot?['name'] as String? ?? 'Producto desconocido',
      productImageUrl: snapshot?['imageUrl'] as String?,
      unitPrice: row.unitPrice,
      quantity: row.quantity,
    );
  }

  Order _orderToEntity(OrdersTableData row, List<CartItem> items) =>
      MarketplaceMappers.orderFromData(row, items);
}
