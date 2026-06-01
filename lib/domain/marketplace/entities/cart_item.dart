// lib/domain/marketplace/entities/cart_item.dart

class CartItem {
  final String id;
  final String orderId; // ID del pedido en estado 'cart'
  final String productId;
  final String productName;
  final String? productImageUrl;
  final double unitPrice; // Precio congelado al momento de agregar
  final int quantity;

  const CartItem({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.productName,
    this.productImageUrl,
    required this.unitPrice,
    required this.quantity,
  });

  /// FIX: subtotal calculado como getter para que siempre refleje
  /// la cantidad actual (incluso después de copyWith)
  double get subtotal => unitPrice * quantity;

  CartItem copyWith({int? quantity}) => CartItem(
    id: id,
    orderId: orderId,
    productId: productId,
    productName: productName,
    productImageUrl: productImageUrl,
    unitPrice: unitPrice,
    quantity: quantity ?? this.quantity,
  );
}
