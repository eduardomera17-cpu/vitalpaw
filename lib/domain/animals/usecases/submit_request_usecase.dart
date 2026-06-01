// lib/domain/animals/usecases/submit_request_usecase.dart

import '../entities/adoption_request.dart';
import '../repositories/adoption_repository.dart';

class SubmitRequestUseCase {
  final AdoptionRepository _repository;

  SubmitRequestUseCase(this._repository);

  Future<AdoptionRequest> execute(SubmitRequestParams params) {
    return _repository.submitRequest(params);
  }
}
