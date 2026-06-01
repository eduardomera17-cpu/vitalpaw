import 'package:url_launcher/url_launcher.dart';
import '../../../domain/appointments/entities/appointment.dart';

/// Servicio para enviar recordatorios vía WhatsApp al cliente.
class WhatsappReminderService {
  /// Envía un mensaje de texto predefinido por WhatsApp.
  ///
  /// Abre la aplicación de WhatsApp si está instalada, o WhatsApp Web si es escritorio.
  /// [phoneNumber] debe incluir el código de país (ej. +521234567890).
  Future<void> sendReminder(Appointment appointment, String phoneNumber) async {
    // Construye un mensaje amigable con los detalles de la cita
    final String message =
        '¡Hola! Te recordamos que tienes una cita programada '
        'en Pet Shop para el servicio de ${appointment.serviceType.name} '
        'el día ${_formatDate(appointment.scheduledAt)} '
        'a las ${_formatTime(appointment.scheduledAt)}. '
        '¡Te esperamos!';

    // URL scheme de WhatsApp para enviar un mensaje directo
    // Uri.encodeComponent codifica los espacios y caracteres especiales para la URL
    final urlString =
        'https://wa.me/${_cleanPhoneNumber(phoneNumber)}?text=${Uri.encodeComponent(message)}';
    final Uri whatsappUrl = Uri.parse(urlString);

    // Intenta abrir el enlace (abre la app de WhatsApp o navegador)
    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    } else {
      // Si falla (por ejemplo, no tiene WhatsApp instalado ni navegador web disponible)
      throw Exception('No se pudo abrir WhatsApp');
    }
  }

  /// Limpia el número de teléfono removiendo espacios, guiones o paréntesis.
  String _cleanPhoneNumber(String phone) {
    return phone.replaceAll(RegExp(r'[^\d+]'), '');
  }

  /// Formatea la fecha a texto (ej: 12/05/2026).
  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  /// Formatea la hora a texto (ej: 14:30).
  String _formatTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }
}
