// lib/domain/marketplace/usecases/remove_from_cart_usecase.dart

import '../repositories/cart_repository.dart';

class RemoveFromCartUseCase {
  final CartRepository _repository;

  RemoveFromCartUseCase(this._repository);

  Future<void> execute(String itemId) async {
    await _repository.removeItem(itemId);
  }
}
