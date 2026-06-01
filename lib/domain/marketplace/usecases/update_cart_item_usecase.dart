// lib/domain/marketplace/usecases/update_cart_item_usecase.dart

import '../repositories/cart_repository.dart';

class UpdateCartItemUseCase {
  final CartRepository _repository;

  UpdateCartItemUseCase(this._repository);

  Future<void> execute({required String itemId, required int quantity}) async {
    await _repository.updateItemQuantity(itemId: itemId, quantity: quantity);
  }
}
