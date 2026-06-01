// lib/domain/animals/usecases/get_listing_detail_usecase.dart

import '../entities/animal_listing.dart';
import '../repositories/animal_repository.dart';

class GetListingDetailUseCase {
  final AnimalRepository _repository;

  GetListingDetailUseCase(this._repository);

  Future<AnimalListing?> execute(String id) {
    return _repository.getListingById(id);
  }
}
