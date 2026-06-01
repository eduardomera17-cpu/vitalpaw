// lib/domain/animals/repositories/animal_repository.dart

import '../entities/animal_listing.dart';

abstract class AnimalRepository {
  /// Stream reactivo del catálogo activo, filtrable.
  Stream<List<AnimalListing>> watchListings({
    AnimalSpecies? species,
    ListingType? type,
  });

  /// Detalle completo de un animal.
  Future<AnimalListing?> getListingById(String id);

  /// Crear o actualizar una ficha (solo staff/admin).
  Future<AnimalListing> saveListing(SaveListingParams params);

  /// Marcar como vendido, adoptado o retirado.
  Future<void> updateStatus({
    required String listingId,
    required AnimalListingStatus status,
    String? reservedByClientId,
  });
}

class SaveListingParams {
  final String? id;              // null = nuevo
  final String name;
  final AnimalSpecies species;
  final String? breed;
  final AnimalGender gender;
  final DateTime? birthDate;
  final double? weightKg;
  final String? colorDesc;
  final bool isNeutered;
  final ListingType listingType;
  final double? salePrice;
  final String description;
  final List<String> localPhotoPaths;
  final String ownerId;

  const SaveListingParams({
    this.id,
    required this.name,
    required this.species,
    this.breed,
    required this.gender,
    this.birthDate,
    this.weightKg,
    this.colorDesc,
    this.isNeutered = false,
    required this.listingType,
    this.salePrice,
    required this.description,
    this.localPhotoPaths = const [],
    required this.ownerId,
  });
}
