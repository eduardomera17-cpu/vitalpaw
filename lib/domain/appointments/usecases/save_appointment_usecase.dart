import '../entities/appointment.dart';
import '../repositories/appointment_repository.dart';

/// Caso de uso para guardar o actualizar una cita.
class SaveAppointmentUseCase {
  final AppointmentRepository _repository;

  SaveAppointmentUseCase(this._repository);

  /// Ejecuta el guardado de la cita.
  Future<void> call(Appointment appointment) async {
    await _repository.saveAppointment(appointment);
  }
}
