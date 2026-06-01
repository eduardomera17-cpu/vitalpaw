import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../domain/appointments/entities/appointment.dart';
import 'appointment_status_chip.dart';

/// Tarjeta visual que muestra el resumen de una cita en las listas de la agenda.
///
/// Al tocarla, puede ejecutar una función (onTap) para ver los detalles.
class AppointmentCard extends StatelessWidget {
  final Appointment appointment;
  final VoidCallback? onTap;

  const AppointmentCard({super.key, required this.appointment, this.onTap});

  @override
  Widget build(BuildContext context) {
    final timeFormat = DateFormat('HH:mm');
    final timeString = timeFormat.format(appointment.scheduledAt);

    // Icono dinámico según el tipo de servicio
    IconData serviceIcon;
    switch (appointment.serviceType) {
      case AppointmentServiceType.vet:
        serviceIcon = Icons.local_hospital;
        break;
      case AppointmentServiceType.grooming:
        serviceIcon = Icons.content_cut;
        break;
      case AppointmentServiceType.boarding:
        serviceIcon = Icons.house;
        break;
      case AppointmentServiceType.bath:
        serviceIcon = Icons.water_drop;
        break;
      default:
        serviceIcon = Icons.pets;
    }

    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Columna de la hora
              Column(
                children: [
                  Text(
                    timeString,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${appointment.durationMinutes} min',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              // Separador vertical
              Container(width: 2, height: 50, color: Colors.grey.shade300),
              const SizedBox(width: 16),
              // Contenido principal
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          serviceIcon,
                          size: 20,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          appointment.serviceType.name.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Nota: Aquí lo ideal sería buscar el nombre de la mascota
                    // usando el petId, pero para mantener la tarjeta simple
                    // mostramos el ID o un texto genérico si no lo pasamos.
                    Text(
                      'Mascota ID: ${appointment.petId.substring(0, 8)}...',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppointmentStatusChip(status: appointment.status),
                        if (appointment.price != null)
                          Text(
                            '\$${appointment.price!.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
