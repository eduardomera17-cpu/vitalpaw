// lib/domain/marketplace/usecases/search_products_usecase.dart

import '../entities/product.dart';
import '../repositories/product_repository.dart';

class SearchProductsUseCase {
  final ProductRepository _repository;

  SearchProductsUseCase(this._repository);

  Future<List<Product>> execute(String query) async {
    return _repository.search(query);
  }
}
