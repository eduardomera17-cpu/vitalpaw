// lib/data/marketplace/payment_service.dart

import '../../domain/marketplace/entities/order.dart';

class PaymentService {
  Future<bool> processPayment({
    required double amount,
    required PaymentMethod method,
  }) async {
    // Aquí iría la integración real con Stripe, PayPal o similar.
    // Por ahora, simulamos un procesamiento exitoso.
    await Future.delayed(const Duration(seconds: 2));

    if (method == PaymentMethod.cash) return true;

    // Simular 5% de probabilidad de error en tarjeta
    final success = DateTime.now().millisecond % 20 != 0;

    return success;
  }
}
