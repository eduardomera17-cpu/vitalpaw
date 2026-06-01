// lib/domain/marketplace/usecases/get_catalog_usecase.dart

import '../entities/product.dart';
import '../repositories/product_repository.dart';

class GetCatalogUseCase {
  final ProductRepository _repository;

  GetCatalogUseCase(this._repository);

  Stream<List<Product>> execute({ProductCategory? category}) {
    return _repository.watchCatalog(category: category);
  }
}
