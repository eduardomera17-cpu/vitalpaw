// lib/data/medical/medical_repository_impl.dart

import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../domain/medical/entities/medical_record.dart';
import '../../domain/medical/entities/weight_entry.dart';
import '../../domain/medical/repositories/medical_repository.dart';
import '../local/database/app_database.dart';
import '../local/daos/medical_records_dao.dart';
import 'attachment_service.dart';

class MedicalRepositoryImpl implements MedicalRepository {
  final MedicalRecordsDao _dao;
  final AttachmentService _attachmentService;

  MedicalRepositoryImpl(this._dao, this._attachmentService);

  @override
  Stream<List<MedicalRecord>> watchPetHistory(String petId) =>
      _dao.watchByPet(petId).map((rows) => rows.map(_toEntity).toList());

  @override
  Stream<List<MedicalRecord>> watchByType(
    String petId,
    MedicalRecordType type,
  ) => _dao
      .watchByType(petId, type.name)
      .map((rows) => rows.map(_toEntity).toList());

  @override
  Stream<List<WeightEntry>> watchWeightHistory(String petId) => _dao
      .watchByType(petId, MedicalRecordType.weightCheck.name)
      .map(
        (rows) =>
            rows
                .where((r) => r.weightKg != null)
                .map(
                  (r) => WeightEntry(
                    date: r.createdAt,
                    weightKg: r.weightKg!,
                    recordId: r.id,
                  ),
                )
                .toList()
              ..sort((a, b) => a.date.compareTo(b.date)),
      );

  @override
  Future<List<MedicalRecord>> getUpcomingDues(String petId) async {
    final cutoff = DateTime.now().add(const Duration(days: 30));
    final all = await _dao.watchByPet(petId).first;
    return all
        .where(
          (r) =>
              r.nextDueDate != null &&
              r.nextDueDate!.isBefore(cutoff) &&
              r.deletedAt == null,
        )
        .map(_toEntity)
        .toList()
      ..sort((a, b) => a.nextDueDate!.compareTo(b.nextDueDate!));
  }

  @override
  Future<List<MedicalRecord>> getConflicts() async {
    final rows = await _dao.getConflicts();
    return rows.map(_toEntity).toList();
  }

  @override
  Future<MedicalRecord> addRecord(AddMedicalRecordParams p) async {
    final now = DateTime.now();
    final id = const Uuid().v4();

    // Guardar en Drift inmediatamente (offline-first)
    await _dao.insertRecord(
      MedicalRecordsTableCompanion.insert(
        id: id,
        petId: p.petId,
        vetId: p.vetId,
        recordType: p.recordType.name,
        title: p.title,
        description: p.description,
        weightKg: Value(p.weightKg),
        medicationName: Value(p.medicationName),
        dosage: Value(p.dosage),
        nextDueDate: Value(p.nextDueDate),
        attachmentLocalPath: Value(p.attachmentLocalPath),
        createdAt: now,
        updatedAt: now,
      ),
    );

    // Si hay adjunto, intentar subir a Firebase Storage en background
    if (p.attachmentLocalPath != null) {
      _attachmentService
          .uploadAttachment(
            localPath: p.attachmentLocalPath!,
            remotePath: 'medical/$id/attachment',
          )
          .then((remoteUrl) => _dao.updateAttachmentUrl(id, remoteUrl))
          .catchError((_) {
            // Fallo silencioso: el SyncWorker lo reintentará después
          });
    }

    return MedicalRecord(
      id: id,
      petId: p.petId,
      vetId: p.vetId,
      vetName: p.vetName,
      recordType: p.recordType,
      title: p.title,
      description: p.description,
      weightKg: p.weightKg,
      medicationName: p.medicationName,
      dosage: p.dosage,
      nextDueDate: p.nextDueDate,
      attachmentLocalPath: p.attachmentLocalPath,
      syncStatus: MedicalSyncStatus.pending,
      syncVersion: 0,
      createdAt: now,
    );
  }

  @override
  Future<void> resolveConflict({
    required String recordId,
    required String adminNotes,
  }) => _dao.resolveConflict(recordId, adminNotes);

  MedicalRecord _toEntity(MedicalRecordsTableData r) => MedicalRecord(
    id: r.id,
    petId: r.petId,
    vetId: r.vetId,
    vetName: '', // resolver con JOIN o provider separado en la UI real
    recordType: MedicalRecordType.values.byName(r.recordType),
    title: r.title,
    description: r.description,
    weightKg: r.weightKg,
    medicationName: r.medicationName,
    dosage: r.dosage,
    nextDueDate: r.nextDueDate,
    attachmentLocalPath: r.attachmentLocalPath,
    attachmentRemoteUrl: r.attachmentRemoteUrl,
    conflictNotes: r.conflictNotes,
    syncStatus: MedicalSyncStatus.fromString(r.syncStatus),
    syncVersion: r.syncVersion,
    createdAt: r.createdAt,
  );
}
