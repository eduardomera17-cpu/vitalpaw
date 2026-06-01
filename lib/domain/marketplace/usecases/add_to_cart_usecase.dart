// lib/domain/marketplace/usecases/add_to_cart_usecase.dart

import '../entities/product.dart';
import '../repositories/cart_repository.dart';

class AddToCartUseCase {
  final CartRepository _repository;

  AddToCartUseCase(this._repository);

  Future<void> execute({
    required String clientId,
    required Product product,
    int quantity = 1,
  }) async {
    await _repository.addItem(
      clientId: clientId,
      product: product,
      quantity: quantity,
    );
  }
}
