// lib/domain/marketplace/usecases/clear_cart_usecase.dart

import '../repositories/cart_repository.dart';

class ClearCartUseCase {
  final CartRepository _repository;

  ClearCartUseCase(this._repository);

  Future<void> execute(String clientId) async {
    await _repository.clearCart(clientId);
  }
}
