// lib/domain/medical/usecases/get_upcoming_dues_usecase.dart

import '../entities/medical_record.dart';
import '../repositories/medical_repository.dart';

class GetUpcomingDuesUseCase {
  final MedicalRepository _repository;

  GetUpcomingDuesUseCase(this._repository);

  Future<List<MedicalRecord>> execute(String petId) {
    return _repository.getUpcomingDues(petId);
  }
}
