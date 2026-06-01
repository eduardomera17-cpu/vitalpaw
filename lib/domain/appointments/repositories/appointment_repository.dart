import '../entities/appointment.dart';

/// Interfaz del Repositorio de Citas (Appointments).
///
/// Define QUÉ operaciones se pueden hacer con las citas, sin importar CÓMO se hacen.
/// La implementación real usará Drift (SQLite) para guardar en el celular.
abstract class AppointmentRepository {
  /// Guarda una cita nueva o actualiza una existente en la base local.
  Future<void> saveAppointment(Appointment appointment);

  /// Obtiene una cita específica por su ID.
  /// Retorna null si no existe.
  Future<Appointment?> getAppointmentById(String id);

  /// Obtiene un flujo en tiempo real (Stream) de las citas de un cliente en particular.
  Stream<List<Appointment>> watchAppointmentsByClient(String clientId);

  /// Obtiene un flujo en tiempo real (Stream) de las citas para un día específico
  /// (muy útil para pintar el calendario de la vista de staff).
  Stream<List<Appointment>> watchAppointmentsByDate(DateTime date);

  /// Elimina "suavemente" una cita (solo la marca como eliminada, para sincronizar
  /// después a la nube).
  Future<void> deleteAppointment(String id);
}
