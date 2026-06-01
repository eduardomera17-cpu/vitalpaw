// lib/domain/medical/usecases/watch_by_type_usecase.dart

import '../entities/medical_record.dart';
import '../repositories/medical_repository.dart';

class WatchByTypeUseCase {
  final MedicalRepository _repository;

  WatchByTypeUseCase(this._repository);

  Stream<List<MedicalRecord>> execute(String petId, MedicalRecordType type) {
    return _repository.watchByType(petId, type);
  }
}
