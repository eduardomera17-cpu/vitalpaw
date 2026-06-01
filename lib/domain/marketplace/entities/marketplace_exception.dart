// lib/domain/marketplace/entities/marketplace_exception.dart

import 'order.dart';

/// Excepción base para errores del marketplace
sealed class MarketplaceException implements Exception {
  final String message;
  const MarketplaceException(this.message);

  @override
  String toString() => message;
}

/// Stock insuficiente para completar la operación
class InsufficientStockException extends MarketplaceException {
  final String productId;
  final String productName;
  final int available;
  final int requested;

  InsufficientStockException({
    required this.productId,
    required this.productName,
    required this.available,
    required this.requested,
  }) : super(
         'Stock insuficiente para "$productName": '
         'disponible $available, solicitado $requested',
       );
}

/// El carrito está vacío al intentar hacer checkout
class EmptyCartException extends MarketplaceException {
  const EmptyCartException() : super('No hay productos en el carrito');
}

/// Producto no encontrado (fue eliminado o desactivado)
class ProductNotFoundException extends MarketplaceException {
  final String productId;
  const ProductNotFoundException(this.productId)
    : super('Producto no encontrado (ID: $productId)');
}

/// Pedido no puede ser cancelado (ya fue procesado)
class OrderNotCancellableException extends MarketplaceException {
  final String orderId;
  final OrderStatus currentStatus;
  OrderNotCancellableException({
    required this.orderId,
    required this.currentStatus,
  }) : super(
         'El pedido no puede ser cancelado. '
         'Estado actual: ${currentStatus.displayName}',
       );
}

/// Error de pasarela de pago
class PaymentException extends MarketplaceException {
  final String? code;
  const PaymentException(super.message, {this.code});
}
