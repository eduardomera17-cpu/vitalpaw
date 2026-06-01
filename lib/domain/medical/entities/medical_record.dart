// lib/domain/medical/entities/medical_record.dart
// CRÍTICO: Esta entidad es inmutable una vez creada.
// No exponer métodos de actualización de contenido clínico.

class MedicalRecord {
  final String id;
  final String petId;
  final String vetId;
  final String vetName; // desnormalizado para UI
  final MedicalRecordType recordType;
  final String title;
  final String description;
  final double? weightKg;
  final String? medicationName;
  final String? dosage;
  final DateTime? nextDueDate; // próxima dosis (vacunas/desparasitaciones)
  final String? attachmentLocalPath; // ruta en Drift (archivo local)
  final String? attachmentRemoteUrl; // URL Firebase Storage (después de sync)
  final String? conflictNotes; // nota del admin al resolver conflicto
  final MedicalSyncStatus syncStatus;
  final int syncVersion;
  final DateTime createdAt;

  const MedicalRecord({
    required this.id,
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
    this.attachmentRemoteUrl,
    this.conflictNotes,
    required this.syncStatus,
    required this.syncVersion,
    required this.createdAt,
  });

  bool get hasAttachment =>
      attachmentLocalPath != null || attachmentRemoteUrl != null;

  bool get isOverdue =>
      nextDueDate != null && nextDueDate!.isBefore(DateTime.now());

  bool get isDueSoon =>
      nextDueDate != null &&
      !isOverdue &&
      nextDueDate!.difference(DateTime.now()).inDays <= 30;

  bool get hasConflict => syncStatus == MedicalSyncStatus.conflict;
}

enum MedicalRecordType {
  vaccine,
  deworming,
  weightCheck,
  diagnosis,
  surgery,
  prescription,
  generalNote;

  String get displayName => switch (this) {
    vaccine => 'Vacuna',
    deworming => 'Desparasitación',
    weightCheck => 'Control de peso',
    diagnosis => 'Diagnóstico',
    surgery => 'Cirugía',
    prescription => 'Receta',
    generalNote => 'Nota general',
  };

  String get icon => switch (this) {
    vaccine => '💉',
    deworming => '🪱',
    weightCheck => '⚖️',
    diagnosis => '🔬',
    surgery => '🏥',
    prescription => '📋',
    generalNote => '📝',
  };

  // Color de acento para la tarjeta
  int get accentColor => switch (this) {
    vaccine => 0xFF4CAF50,
    deworming => 0xFF9C27B0,
    weightCheck => 0xFF2196F3,
    diagnosis => 0xFFFF9800,
    surgery => 0xFFF44336,
    prescription => 0xFF00BCD4,
    generalNote => 0xFF607D8B,
  };
}

enum MedicalSyncStatus {
  pending,
  synced,
  conflict;

  static MedicalSyncStatus fromString(String v) =>
      MedicalSyncStatus.values.byName(v);
}
