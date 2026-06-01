// lib/domain/marketplace/usecases/place_order_usecase.dart

import '../entities/order.dart';
import '../repositories/order_repository.dart';

class PlaceOrderUseCase {
  final OrderRepository _repository;

  PlaceOrderUseCase(this._repository);

  Future<Order> execute(PlaceOrderParams params) async {
    return await _repository.placeOrder(params);
  }
}
