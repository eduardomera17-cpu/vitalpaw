// lib/domain/medical/usecases/watch_pet_history_usecase.dart

import '../entities/medical_record.dart';
import '../repositories/medical_repository.dart';

class WatchPetHistoryUseCase {
  final MedicalRepository _repository;

  WatchPetHistoryUseCase(this._repository);

  Stream<List<MedicalRecord>> execute(String petId) {
    return _repository.watchPetHistory(petId);
  }
}
