// lib/domain/medical/repositories/medical_repository.dart

import '../entities/medical_record.dart';
import '../entities/weight_entry.dart';

abstract class MedicalRepository {
  /// Historial completo de una mascota — cronológico descendente.
  /// APPEND-ONLY: nunca muta registros existentes.
  Stream<List<MedicalRecord>> watchPetHistory(String petId);

  /// Solo registros de un tipo (ej: vacunas).
  Stream<List<MedicalRecord>> watchByType(String petId, MedicalRecordType type);

  /// Registros próximos a vencer (nextDueDate ≤ hoy + 30 días).
  Future<List<MedicalRecord>> getUpcomingDues(String petId);

  /// Registros de peso proyectados para el gráfico.
  Stream<List<WeightEntry>> watchWeightHistory(String petId);

  /// Registros en conflicto — para el panel admin.
  Future<List<MedicalRecord>> getConflicts();

  /// Añadir nuevo registro (solo INSERT — nunca UPDATE de contenido).
  Future<MedicalRecord> addRecord(AddMedicalRecordParams params);

  /// Resolver conflicto manualmente (solo actualiza conflictNotes y syncStatus).
  Future<void> resolveConflict({
    required String recordId,
    required String adminNotes,
  });
}

class AddMedicalRecordParams {
  final String petId;
  final String vetId;
  final String vetName;
  final MedicalRecordType recordType;
  final String title;
  final String description;
  final double? weightKg;
  final String? medicationName;
  final String? dosage;
  final DateTime? nextDueDate;
  final String? attachmentLocalPath; // ruta del archivo temporal local

  const AddMedicalRecordParams({
    required this.petId,
    required this.vetId,
    required this.vetName,
    required this.recordType,
    required this.title,
    required this.description,
    this.weightKg,
    this.medicationName,
    this.dosage,
    this.nextDueDate,
    this.attachmentLocalPath,
  });
}
