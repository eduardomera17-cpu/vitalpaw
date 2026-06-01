// lib/domain/medical/usecases/add_medical_record_usecase.dart

import '../entities/medical_record.dart';
import '../repositories/medical_repository.dart';

class AddMedicalRecordUseCase {
  final MedicalRepository _repository;

  AddMedicalRecordUseCase(this._repository);

  Future<MedicalRecord> execute(AddMedicalRecordParams params) {
    return _repository.addRecord(params);
  }
}
