// lib/domain/marketplace/repositories/cart_repository.dart

import '../entities/cart_item.dart';
import '../entities/order.dart';
import '../entities/product.dart';

abstract class CartRepository {
  /// Carrito activo del cliente (status = 'cart').
  Stream<Order?> watchCart(String clientId);

  /// Items del carrito con datos del producto snapshot.
  Stream<List<CartItem>> watchCartItems(String clientId);

  /// Agregar producto al carrito (crea el pedido si no existe).
  /// Valida stock disponible antes de agregar.
  /// Lanza [InsufficientStockException] si no hay stock.
  /// Lanza [ProductNotFoundException] si el producto no existe.
  Future<void> addItem({
    required String clientId,
    required Product product,
    int quantity = 1,
  });

  /// Actualizar cantidad de un item.
  /// Si quantity <= 0, elimina el item.
  /// Lanza [InsufficientStockException] si la nueva cantidad excede el stock.
  Future<void> updateItemQuantity({
    required String itemId,
    required int quantity,
  });

  /// Eliminar item del carrito (soft delete + recalcula totales).
  Future<void> removeItem(String itemId);

  /// Vaciar carrito completo (soft delete del pedido y todos sus items).
  Future<void> clearCart(String clientId);

  /// Total y subtotal calculados en tiempo real.
  Stream<CartTotals> watchTotals(String clientId);
}

class CartTotals {
  final int itemCount;
  final double subtotal;
  final double deliveryFee;
  final double total;

  const CartTotals({
    required this.itemCount,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
  });

  static const empty = CartTotals(
    itemCount: 0,
    subtotal: 0,
    deliveryFee: 0,
    total: 0,
  );
}
