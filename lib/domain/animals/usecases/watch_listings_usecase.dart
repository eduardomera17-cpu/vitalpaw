// lib/domain/animals/usecases/watch_listings_usecase.dart

import '../entities/animal_listing.dart';
import '../repositories/animal_repository.dart';

class WatchListingsUseCase {
  final AnimalRepository _repository;

  WatchListingsUseCase(this._repository);

  Stream<List<AnimalListing>> execute({AnimalSpecies? species, ListingType? type}) {
    return _repository.watchListings(species: species, type: type);
  }
}
