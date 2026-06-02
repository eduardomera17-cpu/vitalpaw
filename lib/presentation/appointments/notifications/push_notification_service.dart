import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:flutter/foundation.dart';
import '../../../domain/appointments/entities/appointment.dart';

/// Servicio encargado de manejar las notificaciones locales push.
/// Se utiliza para enviar recordatorios de las citas en el dispositivo.
class PushNotificationService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  /// Inicializa el plugin y configura las zonas horarias.
  Future<void> init() async {
    if (kIsWeb) {
      debugPrint('Notificaciones locales no soportadas en Web');
      return;
    }
    // Inicializa la base de datos de zonas horarias para programar alarmas exactas.
    tz.initializeTimeZones();
    try {
      final timeZoneName = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(timeZoneName.toString()));
    } catch (e) {
      debugPrint('Error configurando zona horaria: $e');
      tz.setLocalLocation(tz.getLocation('UTC'));
    }

    // Configuración para Android
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // Configuración para iOS
    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestSoundPermission: true,
        );

    const InitializationSettings initializationSettings =
        InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS,
        );

    await _flutterLocalNotificationsPlugin.initialize(
      settings: initializationSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );
  }

  /// Acción que se ejecuta al tocar la notificación.
  void _onNotificationTapped(NotificationResponse response) {
    // Aquí podríamos navegar a la pantalla de detalles de la cita
    // usando go_router y el ID enviado en el payload.
    debugPrint('Notificación tocada: ${response.payload}');
  }

  /// Programa un recordatorio para una cita específica.
  /// [appointment] La cita para la cual programar el recordatorio.
  /// [minutesBefore] Cuántos minutos antes de la cita debe sonar.
  Future<void> scheduleAppointmentReminder(
    Appointment appointment, {
    int minutesBefore = 60,
  }) async {
    if (kIsWeb) return;

    final scheduleTime = appointment.scheduledAt.subtract(
      Duration(minutes: minutesBefore),
    );

    // Si la hora ya pasó, no programar nada.
    if (scheduleTime.isBefore(DateTime.now())) return;

    final tz.TZDateTime tzScheduleTime = tz.TZDateTime.from(
      scheduleTime,
      tz.local,
    );

    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          'appointment_reminders_channel',
          'Recordatorios de Citas',
          channelDescription: 'Canal para recordar las citas agendadas',
          importance: Importance.max,
          priority: Priority.high,
        );

    const NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
    );

    // Usamos el hashcode del ID (o un número autoincremental si estuviera en Drift)
    // para tener un ID de notificación único como entero.
    final notificationId = appointment.id.hashCode;

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      id: notificationId,
      title: '¡Recordatorio de Cita!',
      body:
          'Tienes una cita para el servicio de ${appointment.serviceType.name} a las ${appointment.scheduledAt.hour}:${appointment.scheduledAt.minute.toString().padLeft(2, '0')}',
      scheduledDate: tzScheduleTime,
      notificationDetails: platformDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      payload: appointment.id,
    );
  }

  /// Cancela un recordatorio programado.
  Future<void> cancelReminder(String appointmentId) async {
    if (kIsWeb) return;
    await _flutterLocalNotificationsPlugin.cancel(id: appointmentId.hashCode);
  }
}
