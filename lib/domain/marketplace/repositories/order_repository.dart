// lib/domain/marketplace/repositories/order_repository.dart

import '../entities/order.dart';

abstract class OrderRepository {
  /// Historial de pedidos de un cliente (excluye carrito).
  /// Ordenado por placedAt descendente.
  Stream<List<Order>> watchOrderHistory(String clientId);

  /// Detalle completo de un pedido con sus items.
  Future<Order?> getOrderWithItems(String orderId);

  /// Confirmar pedido: cart → placed.
  /// 1. Valida stock de todos los items
  /// 2. Decrementa stock en Drift
  /// 3. Transiciona status a 'placed'
  /// Lanza [EmptyCartException] si no hay items.
  /// Lanza [InsufficientStockException] si falta stock.
  Future<Order> placeOrder(PlaceOrderParams params);

  /// Cancelar pedido y restaurar stock.
  /// Lanza [OrderNotCancellableException] si el pedido ya fue procesado.
  Future<void> cancelOrder(String orderId);
}

class PlaceOrderParams {
  final String clientId;
  final String deliveryAddress;
  final double deliveryLat;
  final double deliveryLng;
  final PaymentMethod paymentMethod;
  final double deliveryFee;
  final String? clientNotes;

  const PlaceOrderParams({
    required this.clientId,
    required this.deliveryAddress,
    required this.deliveryLat,
    required this.deliveryLng,
    required this.paymentMethod,
    this.deliveryFee = 0.0, // Se calcula dinámicamente
    this.clientNotes,
  });
}
