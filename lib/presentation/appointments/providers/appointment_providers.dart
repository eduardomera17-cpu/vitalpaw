import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/database_provider.dart';
import '../../../data/appointments/appointment_repository_impl.dart';
import '../../../domain/appointments/repositories/appointment_repository.dart';
import '../../../domain/appointments/usecases/delete_appointment_usecase.dart';
import '../../../domain/appointments/usecases/save_appointment_usecase.dart';
import '../../../domain/appointments/usecases/watch_appointments_by_client_usecase.dart';
import '../../../domain/appointments/usecases/watch_appointments_by_date_usecase.dart';
import '../notifications/push_notification_service.dart';
import '../notifications/whatsapp_reminder_service.dart';

/// Proveedor principal del repositorio de citas.
/// Se encarga de instanciar la implementación y pasarle la base de datos local (Drift).
final appointmentRepositoryProvider = Provider<AppointmentRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return AppointmentRepositoryImpl(db);
});

/// Proveedor del caso de uso para guardar/editar citas.
final saveAppointmentUseCaseProvider = Provider<SaveAppointmentUseCase>((ref) {
  return SaveAppointmentUseCase(ref.watch(appointmentRepositoryProvider));
});

/// Proveedor del caso de uso para eliminar citas lógicamente.
final deleteAppointmentUseCaseProvider = Provider<DeleteAppointmentUseCase>((
  ref,
) {
  return DeleteAppointmentUseCase(ref.watch(appointmentRepositoryProvider));
});

/// Proveedor del caso de uso para observar citas de un día específico (staff).
final watchAppointmentsByDateUseCaseProvider =
    Provider<WatchAppointmentsByDateUseCase>((ref) {
      return WatchAppointmentsByDateUseCase(
        ref.watch(appointmentRepositoryProvider),
      );
    });

/// Proveedor del caso de uso para observar citas de un cliente específico.
final watchAppointmentsByClientUseCaseProvider =
    Provider<WatchAppointmentsByClientUseCase>((ref) {
      return WatchAppointmentsByClientUseCase(
        ref.watch(appointmentRepositoryProvider),
      );
    });

/// Proveedor del servicio de notificaciones locales push.
final pushNotificationServiceProvider = Provider<PushNotificationService>((
  ref,
) {
  return PushNotificationService();
});

/// Proveedor del servicio de mensajes de WhatsApp.
final whatsappReminderServiceProvider = Provider<WhatsappReminderService>((
  ref,
) {
  return WhatsappReminderService();
});
