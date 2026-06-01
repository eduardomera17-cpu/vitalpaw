import 'package:drift/drift.dart';
import '../database/app_database.dart';
import '../tables/appointments_table.dart';

part 'appointments_dao.g.dart';

// CAJERO ESPECÍFICO DE CITAS (APPOINTMENTS DAO)
// Esta clase controla las consultas a la base de datos local para agendar turnos,
// verificar la disponibilidad diaria y coordinar las citas de cada mascota.

@DriftAccessor(tables: [AppointmentsTable])
class AppointmentsDao extends DatabaseAccessor<AppDatabase>
    with _$AppointmentsDaoMixin {
  AppointmentsDao(super.db);

  /// Registra o edita una cita en la base de datos local (Operación Upsert).
  Future<void> upsertAppointment(AppointmentsTableCompanion a) =>
      into(db.appointmentsTable).insertOnConflictUpdate(a);

  /// Obtiene una cita específica de la base de datos local usando su ID único.
  Future<AppointmentsTableData?> getById(String id) => (select(
    db.appointmentsTable,
  )..where((t) => t.id.equals(id))).getSingleOrNull();

  /// Obtiene un canal reactivo (Stream) con la lista de citas activas de un cliente.
  ///
  /// Excluye las citas canceladas o eliminadas lógicamente.
  /// Ordena los turnos en orden cronológico ascendente (las citas más próximas primero).
  Stream<List<AppointmentsTableData>> watchByClient(String clientId) =>
      (select(db.appointmentsTable)
            ..where(
              (t) =>
                  t.clientId.equals(clientId) &
                  t.deletedAt.isNull() &
                  t.status.isNotIn(['cancelled']),
            )
            ..orderBy([(t) => OrderingTerm.asc(t.scheduledAt)]))
          .watch();

  /// Obtiene un canal reactivo (Stream) con la lista de citas activas de una mascota específica.
  ///
  /// Excluye las citas canceladas o eliminadas lógicamente.
  /// Ordena los turnos en orden cronológico ascendente.
  Stream<List<AppointmentsTableData>> watchByPet(String petId) =>
      (select(db.appointmentsTable)
            ..where(
              (t) =>
                  t.petId.equals(petId) &
                  t.deletedAt.isNull() &
                  t.status.isNotIn(['cancelled']),
            )
            ..orderBy([(t) => OrderingTerm.asc(t.scheduledAt)]))
          .watch();

  /// Obtiene un canal reactivo (Stream) con la agenda de citas de un día específico para el personal.
  ///
  /// Calcula el inicio del día (00:00:00) y el final (23:59:59) del [date] solicitado
  /// para filtrar todos los turnos que caigan en ese rango de tiempo.
  /// Ordena cronológicamente.
  Stream<List<AppointmentsTableData>> watchByDate(DateTime date) {
    // Inicio del día (00:00 de hoy)
    final start = DateTime(date.year, date.month, date.day);
    // Inicio del día siguiente (00:00 de mañana)
    final end = start.add(const Duration(days: 1));

    return (select(db.appointmentsTable)
          ..where(
            (t) =>
                t.scheduledAt.isBiggerOrEqualValue(start) &
                t.scheduledAt.isSmallerThanValue(end) &
                t.deletedAt.isNull(),
          )
          ..orderBy([(t) => OrderingTerm.asc(t.scheduledAt)]))
        .watch();
  }

  /// Obtiene las citas pendientes de sincronizar con el servidor en la nube.
  Future<List<AppointmentsTableData>> getPendingSync() => (select(
    db.appointmentsTable,
  )..where((t) => t.syncStatus.equals('pending'))).get();

  /// Marca una cita como ya sincronizada con la nube ('synced').
  Future<void> markSynced(String id) =>
      (update(db.appointmentsTable)..where((t) => t.id.equals(id))).write(
        AppointmentsTableCompanion(
          syncStatus: const Value('synced'),
          updatedAt: Value(DateTime.now()),
        ),
      );

  /// Elimina lógicamente una cita (Soft Delete).
  ///
  /// Guarda la fecha de borrado en 'deletedAt' y marca 'pending' para enviar la orden
  /// de borrado a internet en la siguiente sincronización automática.
  Future<void> softDelete(String id) =>
      (update(db.appointmentsTable)..where((t) => t.id.equals(id))).write(
        AppointmentsTableCompanion(
          deletedAt: Value(DateTime.now()),
          updatedAt: Value(DateTime.now()),
          syncStatus: const Value('pending'),
        ),
      );
}
