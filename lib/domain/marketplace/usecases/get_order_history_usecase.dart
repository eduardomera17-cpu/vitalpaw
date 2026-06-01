// lib/domain/marketplace/usecases/get_order_history_usecase.dart

import '../entities/order.dart';
import '../repositories/order_repository.dart';

class GetOrderHistoryUseCase {
  final OrderRepository _repository;

  GetOrderHistoryUseCase(this._repository);

  Stream<List<Order>> execute(String clientId) {
    return _repository.watchOrderHistory(clientId);
  }
}
