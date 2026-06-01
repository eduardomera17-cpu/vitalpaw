import 'package:flutter/material.dart';
import '../../../domain/appointments/entities/appointment.dart';

/// Un pequeño "chip" o etiqueta visual que muestra el estado de una cita
/// con colores semánticos (ej. verde para completado, amarillo para pendiente).
class AppointmentStatusChip extends StatelessWidget {
  final AppointmentStatus status;

  const AppointmentStatusChip({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;
    String label;

    switch (status) {
      case AppointmentStatus.pending:
        backgroundColor = Colors.orange.shade100;
        textColor = Colors.orange.shade900;
        label = 'Pendiente';
        break;
      case AppointmentStatus.confirmed:
        backgroundColor = Colors.blue.shade100;
        textColor = Colors.blue.shade900;
        label = 'Confirmada';
        break;
      case AppointmentStatus.inProgress:
        backgroundColor = Colors.purple.shade100;
        textColor = Colors.purple.shade900;
        label = 'En atención';
        break;
      case AppointmentStatus.completed:
        backgroundColor = Colors.green.shade100;
        textColor = Colors.green.shade900;
        label = 'Completada';
        break;
      case AppointmentStatus.cancelled:
        backgroundColor = Colors.red.shade100;
        textColor = Colors.red.shade900;
        label = 'Cancelada';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}
