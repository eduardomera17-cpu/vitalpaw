// lib/domain/animals/repositories/adoption_repository.dart

import '../entities/adoption_request.dart';
import '../entities/animal_listing.dart';

abstract class AdoptionRepository {
  /// Enviar solicitud de reserva/adopción.
  Future<AdoptionRequest> submitRequest(SubmitRequestParams params);

  /// Solicitudes de un cliente.
  Stream<List<AdoptionRequest>> watchByClient(String clientId);

  /// Todas las solicitudes pendientes (admin/staff).
  Stream<List<AdoptionRequest>> watchPendingRequests();

  /// Aprobar o rechazar solicitud (admin/staff).
  Future<void> updateRequestStatus({
    required String requestId,
    required AdoptionRequestStatus status,
    String? adminNotes,
  });
}

class SubmitRequestParams {
  final String listingId;
  final String animalName;
  final String clientId;
  final String clientName;
  final String clientPhone;
  final String clientEmail;
  final ListingType requestType;
  final String? message;

  const SubmitRequestParams({
    required this.listingId,
    required this.animalName,
    required this.clientId,
    required this.clientName,
    required this.clientPhone,
    required this.clientEmail,
    required this.requestType,
    this.message,
  });
}
