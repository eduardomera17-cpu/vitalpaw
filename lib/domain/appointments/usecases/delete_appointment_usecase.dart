import '../repositories/appointment_repository.dart';

/// Caso de uso para eliminar (soft delete) una cita.
class DeleteAppointmentUseCase {
  final AppointmentRepository _repository;

  DeleteAppointmentUseCase(this._repository);

  /// Ejecuta la eliminación lógica.
  Future<void> call(String id) async {
    await _repository.deleteAppointment(id);
  }
}
