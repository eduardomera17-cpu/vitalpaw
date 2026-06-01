// lib/domain/animals/usecases/update_request_status_usecase.dart

import '../entities/adoption_request.dart';
import '../repositories/adoption_repository.dart';

class UpdateRequestStatusUseCase {
  final AdoptionRepository _repository;

  UpdateRequestStatusUseCase(this._repository);

  Future<void> execute({
    required String requestId,
    required AdoptionRequestStatus status,
    String? adminNotes,
  }) {
    return _repository.updateRequestStatus(
      requestId: requestId,
      status: status,
      adminNotes: adminNotes,
    );
  }
}
