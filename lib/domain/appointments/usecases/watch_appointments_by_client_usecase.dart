import '../entities/appointment.dart';
import '../repositories/appointment_repository.dart';

/// Caso de uso para obtener las citas de un cliente en tiempo real.
class WatchAppointmentsByClientUseCase {
  final AppointmentRepository _repository;

  WatchAppointmentsByClientUseCase(this._repository);

  /// Devuelve el flujo (Stream) de citas del cliente.
  Stream<List<Appointment>> call(String clientId) {
    return _repository.watchAppointmentsByClient(clientId);
  }
}
