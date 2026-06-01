// lib/data/animals/animal_repository_impl.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart';

import '../../domain/animals/entities/animal_listing.dart';
import '../../domain/animals/repositories/animal_repository.dart';
import '../local/database/app_database.dart';
import '../local/daos/pets_dao.dart';
// Note: AttachmentService and other deps might be injected differently in your architecture.
// I'll leave this mock definition here, but you should import your real AttachmentService.
// import '../../core/services/attachment_service.dart';

class AttachmentService {
  Future<String> uploadAttachment({required String localPath, required String remotePath}) async {
    // Placeholder implementation
    return 'https://via.placeholder.com/400';
  }
}

class AnimalRepositoryImpl implements AnimalRepository {
  final PetsDao _petsDao;
  final FirebaseFirestore _firestore;
  final AttachmentService _attachmentService;

  AnimalRepositoryImpl(this._petsDao, this._firestore, this._attachmentService);

  @override
  Stream<List<AnimalListing>> watchListings({
    AnimalSpecies? species,
    ListingType? type,
  }) =>
      _petsDao.watchForSaleOrAdoption().map((rows) => rows
          .where((r) {
            if (species != null && r.species != species.name) return false;
            if (type == ListingType.sale && !r.isForSale) return false;
            if (type == ListingType.adoption && !r.isForAdoption) return false;
            return true;
          })
          .map(_toListing)
          .toList());

  @override
  Future<AnimalListing?> getListingById(String id) async {
    final rows = await _petsDao.watchForSaleOrAdoption().first;
    final row = rows.where((r) => r.id == id).firstOrNull;
    return row != null ? _toListing(row) : null;
  }

  @override
  Future<AnimalListing> saveListing(SaveListingParams p) async {
    final now = DateTime.now();
    final id = p.id ?? const Uuid().v4();

    await _petsDao.upsertPet(PetsTableCompanion(
      id: Value(id),
      ownerId: Value(p.ownerId),
      name: Value(p.name),
      species: Value(p.species.name),
      breed: Value(p.breed),
      gender: Value(p.gender.name),
      birthDate: Value(p.birthDate),
      weightKg: Value(p.weightKg),
      colorDesc: Value(p.colorDesc),
      isNeutered: Value(p.isNeutered),
      isForSale: Value(p.listingType == ListingType.sale),
      isForAdoption: Value(p.listingType == ListingType.adoption),
      salePrice: Value(p.salePrice),
      notes: Value(p.description),
      photoLocalPath: Value(
        p.localPhotoPaths.isNotEmpty ? p.localPhotoPaths.first : null,
      ),
      createdAt: Value(now),
      updatedAt: Value(now),
      syncStatus: const Value('pending'),
    ));

    // Subir fotos a Firebase Storage en background
    if (p.localPhotoPaths.isNotEmpty) {
      Future.microtask(() async {
        for (int i = 0; i < p.localPhotoPaths.length; i++) {
          final url = await _attachmentService.uploadAttachment(
            localPath: p.localPhotoPaths[i],
            remotePath: 'animals/$id/photo_$i',
          );
          // Guardar la primera foto como URL remota
          if (i == 0) {
            await _petsDao.upsertPet(PetsTableCompanion(
              id: Value(id),
              photoRemoteUrl: Value(url),
              updatedAt: Value(DateTime.now()),
            ));
          }
        }
      });
    }

    return AnimalListing(
      id: id,
      name: p.name,
      species: p.species,
      breed: p.breed,
      gender: p.gender,
      birthDate: p.birthDate,
      weightKg: p.weightKg,
      colorDesc: p.colorDesc,
      isNeutered: p.isNeutered,
      listingType: p.listingType,
      salePrice: p.salePrice,
      description: p.description,
      photoLocalPaths: p.localPhotoPaths,
      status: AnimalListingStatus.available,
      ownerId: p.ownerId,
      createdAt: now,
      updatedAt: now,
    );
  }

  @override
  Future<void> updateStatus({
    required String listingId,
    required AnimalListingStatus status,
    String? reservedByClientId,
  }) async {
    final isActive = status == AnimalListingStatus.available;
    await _petsDao.upsertPet(PetsTableCompanion(
      id: Value(listingId),
      isForSale: Value(isActive),
      isForAdoption: Value(isActive),
      updatedAt: Value(DateTime.now()),
      syncStatus: const Value('pending'),
    ));
  }

  AnimalListing _toListing(PetsTableData r) => AnimalListing(
        id: r.id,
        name: r.name,
        species: AnimalSpecies.values.byName(r.species),
        breed: r.breed,
        gender: r.gender != null
            ? AnimalGender.values.byName(r.gender!)
            : AnimalGender.unknown,
        birthDate: r.birthDate,
        weightKg: r.weightKg,
        colorDesc: r.colorDesc,
        isNeutered: r.isNeutered,
        listingType: r.isForSale ? ListingType.sale : ListingType.adoption,
        salePrice: r.salePrice,
        description: r.notes ?? '',
        photoUrls: r.photoRemoteUrl != null ? [r.photoRemoteUrl!] : [],
        photoLocalPaths: r.photoLocalPath != null ? [r.photoLocalPath!] : [],
        status: AnimalListingStatus.available,
        ownerId: r.ownerId,
        createdAt: r.createdAt ?? DateTime.now(),
        updatedAt: r.updatedAt ?? DateTime.now(),
      );
}
