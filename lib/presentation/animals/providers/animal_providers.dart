// lib/presentation/animals/providers/animal_providers.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/animals/entities/animal_listing.dart';
import '../../../domain/animals/repositories/animal_repository.dart';
import '../../../domain/animals/repositories/adoption_repository.dart';
import '../../../domain/animals/usecases/watch_listings_usecase.dart';
import '../../../domain/animals/usecases/get_listing_detail_usecase.dart';
import '../../../domain/animals/usecases/submit_request_usecase.dart';
import '../../../domain/animals/usecases/update_request_status_usecase.dart';

import '../../../data/local/database/app_database.dart';
import '../../../data/animals/animal_repository_impl.dart';
import '../../../data/animals/adoption_repository_impl.dart';
import '../../../core/providers/database_provider.dart';

// Providers base
final animalRepositoryProvider = Provider<AnimalRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  final firestore = FirebaseFirestore.instance;
  // Mapear AttachmentService si lo tuvieras, por ahora instanciamos el dummy
  final attachmentService = AttachmentService(); 
  return AnimalRepositoryImpl(db.petsDao, firestore, attachmentService);
});

final adoptionRepositoryProvider = Provider<AdoptionRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  final firestore = FirebaseFirestore.instance;
  return AdoptionRepositoryImpl(db.adoptionRequestsDao, firestore);
});

// Use Cases
final watchListingsUseCaseProvider = Provider<WatchListingsUseCase>((ref) {
  return WatchListingsUseCase(ref.watch(animalRepositoryProvider));
});

final getListingDetailUseCaseProvider = Provider<GetListingDetailUseCase>((ref) {
  return GetListingDetailUseCase(ref.watch(animalRepositoryProvider));
});

final submitRequestUseCaseProvider = Provider<SubmitRequestUseCase>((ref) {
  return SubmitRequestUseCase(ref.watch(adoptionRepositoryProvider));
});

final updateRequestStatusUseCaseProvider = Provider<UpdateRequestStatusUseCase>((ref) {
  return UpdateRequestStatusUseCase(ref.watch(adoptionRepositoryProvider));
});

// Stream Providers de UI
class AnimalListingsFilter {
  final AnimalSpecies? species;
  final ListingType? type;
  const AnimalListingsFilter({this.species, this.type});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnimalListingsFilter &&
          runtimeType == other.runtimeType &&
          species == other.species &&
          type == other.type;

  @override
  int get hashCode => species.hashCode ^ type.hashCode;
}

class AnimalListingsFilterNotifier extends Notifier<AnimalListingsFilter> {
  @override
  AnimalListingsFilter build() => const AnimalListingsFilter();

  void updateFilter(AnimalListingsFilter filter) {
    state = filter;
  }
}

final animalListingsFilterProvider = NotifierProvider<AnimalListingsFilterNotifier, AnimalListingsFilter>(() {
  return AnimalListingsFilterNotifier();
});

final animalListingsProvider = StreamProvider<List<AnimalListing>>((ref) {
  final filter = ref.watch(animalListingsFilterProvider);
  final usecase = ref.watch(watchListingsUseCaseProvider);
  return usecase.execute(species: filter.species, type: filter.type);
});

// Mock del usuario actual, en producción vendría de tu capa de auth
final currentUserProvider = Provider<Map<String, String>>((ref) {
  return {
    'id': 'user_123',
    'name': 'Eduardo',
    'phone': '1234567890',
    'email': 'eduardo@example.com',
  };
});
