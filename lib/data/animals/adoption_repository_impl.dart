// lib/data/animals/adoption_repository_impl.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart';

import '../../domain/animals/entities/adoption_request.dart';
import '../../domain/animals/entities/animal_listing.dart';
import '../../domain/animals/repositories/adoption_repository.dart';
import '../local/database/app_database.dart';
import '../local/daos/adoption_requests_dao.dart';

class AdoptionRepositoryImpl implements AdoptionRepository {
  final AdoptionRequestsDao _dao;
  final FirebaseFirestore _firestore;

  AdoptionRepositoryImpl(this._dao, this._firestore);

  @override
  Future<AdoptionRequest> submitRequest(SubmitRequestParams p) async {
    final now = DateTime.now();
    final id = const Uuid().v4();

    await _dao.insertRequest(AdoptionRequestsTableCompanion.insert(
      id: id,
      listingId: p.listingId,
      animalName: p.animalName,
      clientId: p.clientId,
      clientName: p.clientName,
      clientPhone: p.clientPhone,
      clientEmail: p.clientEmail,
      requestType: p.requestType.name,
      message: Value(p.message),
      status: const Value('pending'),
      createdAt: now,
      updatedAt: now,
    ));

    return AdoptionRequest(
      id: id,
      listingId: p.listingId,
      animalName: p.animalName,
      clientId: p.clientId,
      clientName: p.clientName,
      clientPhone: p.clientPhone,
      clientEmail: p.clientEmail,
      requestType: p.requestType,
      message: p.message,
      status: AdoptionRequestStatus.pending,
      createdAt: now,
      updatedAt: now,
    );
  }

  @override
  Stream<List<AdoptionRequest>> watchByClient(String clientId) =>
      _dao.watchByClient(clientId).map(
            (rows) => rows.map(_toEntity).toList(),
          );

  @override
  Stream<List<AdoptionRequest>> watchPendingRequests() =>
      _dao.watchPending().map((rows) => rows.map(_toEntity).toList());

  @override
  Future<void> updateRequestStatus({
    required String requestId,
    required AdoptionRequestStatus status,
    String? adminNotes,
  }) async {
    await _dao.updateStatus(
      requestId: requestId,
      status: status.name,
      adminNotes: adminNotes,
    );

    // Sincronizar a Firestore inmediatamente (staff siempre online)
    await _firestore
        .collection('adoption_requests')
        .doc(requestId)
        .update({
      'status': status.name,
      'adminNotes': adminNotes,
      'updatedAt': Timestamp.fromDate(DateTime.now()),
    });
  }

  AdoptionRequest _toEntity(AdoptionRequestsTableData r) => AdoptionRequest(
        id: r.id,
        listingId: r.listingId,
        animalName: r.animalName,
        clientId: r.clientId,
        clientName: r.clientName,
        clientPhone: r.clientPhone,
        clientEmail: r.clientEmail,
        requestType: ListingType.values.byName(r.requestType),
        message: r.message,
        status: AdoptionRequestStatus.values.byName(r.status),
        adminNotes: r.adminNotes,
        createdAt: r.createdAt,
        updatedAt: r.updatedAt,
      );
}
