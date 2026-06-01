// lib/domain/animals/entities/adoption_request.dart

import 'animal_listing.dart';

class AdoptionRequest {
  final String id;
  final String listingId;
  final String animalName;
  final String clientId;
  final String clientName;
  final String clientPhone;
  final String clientEmail;
  final ListingType requestType;   // sale o adoption
  final String? message;           // mensaje del solicitante
  final AdoptionRequestStatus status;
  final String? adminNotes;        // notas del staff al gestionar
  final DateTime createdAt;
  final DateTime updatedAt;

  const AdoptionRequest({
    required this.id,
    required this.listingId,
    required this.animalName,
    required this.clientId,
    required this.clientName,
    required this.clientPhone,
    required this.clientEmail,
    required this.requestType,
    this.message,
    required this.status,
    this.adminNotes,
    required this.createdAt,
    required this.updatedAt,
  });

  bool get isPending  => status == AdoptionRequestStatus.pending;
  bool get isApproved => status == AdoptionRequestStatus.approved;
}

enum AdoptionRequestStatus {
  pending, approved, rejected, cancelled;

  String get displayName => switch (this) {
        pending   => 'Pendiente',
        approved  => 'Aprobada',
        rejected  => 'Rechazada',
        cancelled => 'Cancelada',
      };

  int get colorValue => switch (this) {
        pending   => 0xFFFFF3CD,
        approved  => 0xFFD4EDDA,
        rejected  => 0xFFF8D7DA,
        cancelled => 0xFFE2E3E5,
      };

  int get textColorValue => switch (this) {
        pending   => 0xFF856404,
        approved  => 0xFF155724,
        rejected  => 0xFF721C24,
        cancelled => 0xFF383D41,
      };
}
