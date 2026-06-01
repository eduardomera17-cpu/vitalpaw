// lib/presentation/medical/providers/medical_providers.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/database_provider.dart';
import '../../../data/medical/attachment_service.dart';
import '../../../data/medical/medical_repository_impl.dart';
import '../../../domain/medical/entities/medical_record.dart';
import '../../../domain/medical/entities/weight_entry.dart';
import '../../../domain/medical/repositories/medical_repository.dart';
import '../../../domain/medical/usecases/add_medical_record_usecase.dart';
import '../../../domain/medical/usecases/get_upcoming_dues_usecase.dart';
import '../../../domain/medical/usecases/resolve_conflict_usecase.dart';
import '../../../domain/medical/usecases/watch_by_type_usecase.dart';
import '../../../domain/medical/usecases/watch_pet_history_usecase.dart';

// Repositorio
final medicalRepositoryProvider = Provider<MedicalRepository>((ref) {
  final appDatabase = ref.watch(appDatabaseProvider);
  return MedicalRepositoryImpl(
    appDatabase.medicalRecordsDao,
    ref.watch(attachmentServiceProvider),
  );
});

// UseCases
final addMedicalRecordUseCaseProvider = Provider(
  (ref) => AddMedicalRecordUseCase(ref.watch(medicalRepositoryProvider)),
);

final resolveConflictUseCaseProvider = Provider(
  (ref) => ResolveConflictUseCase(ref.watch(medicalRepositoryProvider)),
);

final watchPetHistoryUseCaseProvider = Provider(
  (ref) => WatchPetHistoryUseCase(ref.watch(medicalRepositoryProvider)),
);

final watchByTypeUseCaseProvider = Provider(
  (ref) => WatchByTypeUseCase(ref.watch(medicalRepositoryProvider)),
);

final getUpcomingDuesUseCaseProvider = Provider(
  (ref) => GetUpcomingDuesUseCase(ref.watch(medicalRepositoryProvider)),
);

// Streams
final petHistoryProvider = StreamProvider.family<List<MedicalRecord>, String>((
  ref,
  petId,
) {
  return ref.watch(watchPetHistoryUseCaseProvider).execute(petId);
});

typedef PetTypeParams = ({String petId, MedicalRecordType type});

final petHistoryByTypeProvider =
    StreamProvider.family<List<MedicalRecord>, PetTypeParams>((ref, p) {
      return ref.watch(watchByTypeUseCaseProvider).execute(p.petId, p.type);
    });

final weightHistoryProvider = StreamProvider.family<List<WeightEntry>, String>((
  ref,
  petId,
) {
  return ref.watch(medicalRepositoryProvider).watchWeightHistory(petId);
});

final upcomingDuesProvider = FutureProvider.family<List<MedicalRecord>, String>(
  (ref, petId) {
    return ref.watch(getUpcomingDuesUseCaseProvider).execute(petId);
  },
);

// Conflictos — solo para admin/staff
final medicalConflictsProvider = FutureProvider<List<MedicalRecord>>((ref) {
  return ref.watch(medicalRepositoryProvider).getConflicts();
});
