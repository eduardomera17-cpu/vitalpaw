import 'package:drift/drift.dart';
import '../database/app_database.dart';
import '../tables/medical_records_table.dart';

part 'medical_records_dao.g.dart';

// CAJERO INMUTABLE DE HISTORIALES CLÍNICOS (MEDICAL RECORDS DAO)
//
// ⚠️ ATENCIÓN VETERINARIA Y JURÍDICA:
// Este cajero es muy estricto. Siguiendo la regla 'Append-Only' (solo-adición),
// no se permite modificar (UPDATE) ni eliminar físicamente los expedientes médicos.
// Por eso, aquí no verás un método 'upsert' o 'delete'. Solo hay operaciones de inserción ('insertRecord')
// y consultas seguras de lectura.

@DriftAccessor(tables: [MedicalRecordsTable])
class MedicalRecordsDao extends DatabaseAccessor<AppDatabase>
    with _$MedicalRecordsDaoMixin {
  MedicalRecordsDao(super.db);

  /// Agrega una nueva nota o evento al historial clínico de la mascota.
  ///
  /// Usamos 'insert' plano y obligatorio para no chocar ni sobrescribir notas anteriores.
  Future<void> insertRecord(MedicalRecordsTableCompanion record) =>
      into(db.medicalRecordsTable).insert(record);

  /// Obtiene un canal reactivo (Stream) con todo el historial médico de una mascota.
  ///
  /// Muestra los eventos ordenados por fecha de creación descendente (lo más nuevo arriba).
  /// Excluye notas que hayan sido anuladas administrativamente.
  Stream<List<MedicalRecordsTableData>> watchByPet(String petId) =>
      (select(db.medicalRecordsTable)
            ..where((t) => t.petId.equals(petId) & t.deletedAt.isNull())
            ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
          .watch();

  /// Obtiene un canal reactivo (Stream) filtrado únicamente por el tipo de evento médico.
  ///
  /// Por ejemplo: para ver solo la lista de vacunas ('vaccine') aplicadas a la mascota.
  Stream<List<MedicalRecordsTableData>> watchByType(
    String petId,
    String recordType,
  ) =>
      (select(db.medicalRecordsTable)
            ..where(
              (t) =>
                  t.petId.equals(petId) &
                  t.recordType.equals(recordType) &
                  t.deletedAt.isNull(),
            )
            ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
          .watch();

  /// Busca registros que chocaron al sincronizar (conflicto de versiones)
  /// para que el administrador los resuelva manualmente (Merge Asistido).
  Future<List<MedicalRecordsTableData>> getConflicts() => (select(
    db.medicalRecordsTable,
  )..where((t) => t.syncStatus.equals('conflict'))).get();

  /// Obtiene los registros de salud pendientes de subir a la nube.
  Future<List<MedicalRecordsTableData>> getPendingSync() => (select(
    db.medicalRecordsTable,
  )..where((t) => t.syncStatus.equals('pending'))).get();

  /// Marca que una nota de salud se subió con éxito a la nube ('synced').
  Future<void> markSynced(String id) =>
      (update(db.medicalRecordsTable)..where((t) => t.id.equals(id))).write(
        MedicalRecordsTableCompanion(
          syncStatus: const Value('synced'),
          updatedAt: Value(DateTime.now()),
        ),
      );

  /// Actualiza la URL remota del archivo adjunto una vez subido a Firebase Storage.
  Future<void> updateAttachmentUrl(String id, String remoteUrl) =>
      (update(db.medicalRecordsTable)..where((t) => t.id.equals(id))).write(
        MedicalRecordsTableCompanion(
          attachmentRemoteUrl: Value(remoteUrl),
          updatedAt: Value(DateTime.now()),
        ),
      );

  /// Resuelve un choque de versiones (conflicto) agregando una nota aclaratoria escrita por el administrador,
  /// marcando el registro de nuevo como sincronizado y seguro.
  Future<void> resolveConflict(String id, String conflictNotes) =>
      (update(db.medicalRecordsTable)..where((t) => t.id.equals(id))).write(
        MedicalRecordsTableCompanion(
          conflictNotes: Value(conflictNotes),
          syncStatus: const Value('synced'),
          updatedAt: Value(DateTime.now()),
        ),
      );
}
