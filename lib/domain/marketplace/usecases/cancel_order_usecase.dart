// lib/domain/marketplace/usecases/cancel_order_usecase.dart

import '../repositories/order_repository.dart';

class CancelOrderUseCase {
  final OrderRepository _repository;

  CancelOrderUseCase(this._repository);

  Future<void> execute(String orderId) async {
    await _repository.cancelOrder(orderId);
  }
}
