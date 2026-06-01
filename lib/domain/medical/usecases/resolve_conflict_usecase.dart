// lib/domain/medical/usecases/resolve_conflict_usecase.dart

import '../repositories/medical_repository.dart';

class ResolveConflictUseCase {
  final MedicalRepository _repository;

  ResolveConflictUseCase(this._repository);

  Future<void> execute({required String recordId, required String adminNotes}) {
    return _repository.resolveConflict(
      recordId: recordId,
      adminNotes: adminNotes,
    );
  }
}
