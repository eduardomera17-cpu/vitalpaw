import '../entities/appointment.dart';
import '../repositories/appointment_repository.dart';

/// Caso de uso para obtener las citas programadas en un día específico.
class WatchAppointmentsByDateUseCase {
  final AppointmentRepository _repository;

  WatchAppointmentsByDateUseCase(this._repository);

  /// Devuelve el flujo (Stream) de citas para un día.
  Stream<List<Appointment>> call(DateTime date) {
    return _repository.watchAppointmentsByDate(date);
  }
}
