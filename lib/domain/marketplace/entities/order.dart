// lib/domain/marketplace/entities/order.dart

import 'cart_item.dart';

class Order {
  final String id;
  final String clientId;
  final String? driverId;
  final OrderStatus status;
  final List<CartItem> items;
  final double subtotal;
  final double deliveryFee;
  final double totalAmount;
  final String? deliveryAddress;
  final double? deliveryLat;
  final double? deliveryLng;
  final PaymentMethod? paymentMethod;
  final PaymentStatus paymentStatus;
  final String? clientNotes;
  final DateTime? placedAt;
  final DateTime? deliveredAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Order({
    required this.id,
    required this.clientId,
    this.driverId,
    required this.status,
    required this.items,
    required this.subtotal,
    this.deliveryFee = 0.0,
    required this.totalAmount,
    this.deliveryAddress,
    this.deliveryLat,
    this.deliveryLng,
    this.paymentMethod,
    this.paymentStatus = PaymentStatus.pending,
    this.clientNotes,
    this.placedAt,
    this.deliveredAt,
    required this.createdAt,
    required this.updatedAt,
  });

  bool get isCart => status == OrderStatus.cart;

  bool get canBeCancelled =>
      status == OrderStatus.placed || status == OrderStatus.confirmed;

  int get totalItems => items.fold(0, (sum, i) => sum + i.quantity);

  /// Verifica si el pedido ya fue procesado (no se puede modificar)
  bool get isProcessed =>
      status == OrderStatus.preparing ||
      status == OrderStatus.ready ||
      status == OrderStatus.delivering ||
      status == OrderStatus.delivered;
}

enum OrderStatus {
  cart,
  placed,
  confirmed,
  preparing,
  ready,
  delivering,
  delivered,
  cancelled;

  String get displayName => switch (this) {
    cart => 'Carrito',
    placed => 'Pedido realizado',
    confirmed => 'Confirmado',
    preparing => 'Preparando',
    ready => 'Listo para envío',
    delivering => 'En camino',
    delivered => 'Entregado',
    cancelled => 'Cancelado',
  };

  String get icon => switch (this) {
    cart => '🛒',
    placed => '📦',
    confirmed => '✅',
    preparing => '👨🍳',
    ready => '📫',
    delivering => '🚴',
    delivered => '🏠',
    cancelled => '❌',
  };

  static OrderStatus fromString(String value) {
    return OrderStatus.values.firstWhere(
      (s) => s.name == value,
      orElse: () => OrderStatus.cart,
    );
  }
}

enum PaymentMethod {
  cash,
  card,
  transfer,
  online;

  String get displayName => switch (this) {
    cash => 'Efectivo',
    card => 'Tarjeta (en entrega)',
    transfer => 'Transferencia',
    online => 'Pago en línea',
  };

  String get icon => switch (this) {
    cash => '💵',
    card => '💳',
    transfer => '🏦',
    online => '📱',
  };

  static PaymentMethod fromString(String value) {
    return PaymentMethod.values.firstWhere(
      (m) => m.name == value,
      orElse: () => PaymentMethod.cash,
    );
  }
}

enum PaymentStatus {
  pending,
  paid,
  refunded;

  String get displayName => switch (this) {
    pending => 'Pendiente',
    paid => 'Pagado',
    refunded => 'Reembolsado',
  };

  static PaymentStatus fromString(String value) {
    return PaymentStatus.values.firstWhere(
      (p) => p.name == value,
      orElse: () => PaymentStatus.pending,
    );
  }
}
