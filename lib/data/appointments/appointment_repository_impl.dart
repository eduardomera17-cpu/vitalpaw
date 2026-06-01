import 'package:drift/drift.dart';
import '../../domain/appointments/entities/appointment.dart';
import '../../domain/appointments/repositories/appointment_repository.dart';
import '../local/database/app_database.dart';

/// Implementación del repositorio de citas utilizando Drift (SQLite local).
///
/// Esta clase es el puente entre las Entidades puras de la app y el modelo
/// de base de datos local.
class AppointmentRepositoryImpl implements AppointmentRepository {
  final AppDatabase _db;

  AppointmentRepositoryImpl(this._db);

  @override
  Future<void> saveAppointment(Appointment appointment) async {
    final companion = AppointmentsTableCompanion(
      id: Value(appointment.id),
      petId: Value(appointment.petId),
      clientId: Value(appointment.clientId),
      staffId: Value(appointment.staffId),
      serviceType: Value(appointment.serviceType.name),
      status: Value(appointment.status.name),
      scheduledAt: Value(appointment.scheduledAt),
      durationMinutes: Value(appointment.durationMinutes),
      price: Value(appointment.price),
      notes: Value(appointment.notes),
      reminderSent: Value(appointment.reminderSent),
      whatsappSent: Value(appointment.whatsappSent),
      createdAt: Value(DateTime.now()),
      updatedAt: Value(DateTime.now()),
      syncStatus: const Value('pending'),
    );

    await _db.appointmentsDao.upsertAppointment(companion);
  }

  @override
  Future<Appointment?> getAppointmentById(String id) async {
    final data = await _db.appointmentsDao.getById(id);
    if (data == null) return null;
    return _mapToEntity(data);
  }

  @override
  Stream<List<Appointment>> watchAppointmentsByClient(String clientId) {
    return _db.appointmentsDao.watchByClient(clientId).map((list) {
      return list.map(_mapToEntity).toList();
    });
  }

  @override
  Stream<List<Appointment>> watchAppointmentsByDate(DateTime date) {
    return _db.appointmentsDao.watchByDate(date).map((list) {
      return list.map(_mapToEntity).toList();
    });
  }

  @override
  Future<void> deleteAppointment(String id) async {
    await _db.appointmentsDao.softDelete(id);
  }

  /// Convierte un modelo de tabla Drift a una Entidad pura.
  Appointment _mapToEntity(AppointmentsTableData data) {
    return Appointment(
      id: data.id,
      petId: data.petId,
      clientId: data.clientId,
      staffId: data.staffId,
      serviceType: AppointmentServiceType.values.firstWhere(
        (e) => e.name == data.serviceType,
        orElse: () => AppointmentServiceType.other,
      ),
      status: AppointmentStatus.values.firstWhere(
        (e) => e.name == data.status,
        orElse: () => AppointmentStatus.pending,
      ),
      scheduledAt: data.scheduledAt,
      durationMinutes: data.durationMinutes,
      price: data.price,
      notes: data.notes,
      reminderSent: data.reminderSent,
      whatsappSent: data.whatsappSent,
    );
  }
}
