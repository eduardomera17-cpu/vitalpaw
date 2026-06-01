import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../domain/appointments/entities/appointment.dart';
import 'providers/appointment_providers.dart';
import 'widgets/appointment_status_chip.dart';

/// Pantalla que muestra los detalles completos de una cita.
class AppointmentDetailScreen extends ConsumerWidget {
  final String appointmentId;

  const AppointmentDetailScreen({super.key, required this.appointmentId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Para simplificar, buscamos la cita directamente.
    // En una app más grande, usaríamos un StreamBuilder o FutureProvider específico para esto.

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle de la Cita'),
        actions: [
          // Botón para editar (si no está completada/cancelada)
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              context.push('/appointments/edit/$appointmentId');
            },
          ),
        ],
      ),
      body: FutureBuilder<Appointment?>(
        future: ref
            .read(appointmentRepositoryProvider)
            .getAppointmentById(appointmentId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final appointment = snapshot.data;

          if (appointment == null) {
            return const Center(child: Text('Cita no encontrada.'));
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Cabecera con estado y fecha
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppointmentStatusChip(status: appointment.status),
                    Text(
                      DateFormat('dd MMM yyyy').format(appointment.scheduledAt),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Sección Servicio
                _buildInfoRow(
                  Icons.medical_services,
                  'Servicio',
                  appointment.serviceType.name.toUpperCase(),
                ),
                const SizedBox(height: 16),

                // Sección Hora
                _buildInfoRow(
                  Icons.access_time,
                  'Hora',
                  '${DateFormat('HH:mm').format(appointment.scheduledAt)} (${appointment.durationMinutes} min)',
                ),
                const SizedBox(height: 16),

                // Sección Mascota (Mocks por ahora)
                _buildInfoRow(
                  Icons.pets,
                  'Mascota',
                  'ID: ${appointment.petId}',
                ),
                const SizedBox(height: 16),

                // Sección Cliente
                _buildInfoRow(
                  Icons.person,
                  'Cliente',
                  'ID: ${appointment.clientId}',
                ),
                const SizedBox(height: 16),

                if (appointment.price != null) ...[
                  _buildInfoRow(
                    Icons.attach_money,
                    'Costo Estimado',
                    '\$${appointment.price!.toStringAsFixed(2)}',
                  ),
                  const SizedBox(height: 16),
                ],

                if (appointment.notes != null &&
                    appointment.notes!.isNotEmpty) ...[
                  const Divider(),
                  const Text(
                    'Notas',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(appointment.notes!),
                ],

                const SizedBox(height: 32),

                // Botones de acción (ej. cambiar estado, enviar recordatorio WA)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      // Llamada al servicio de WhatsApp
                      try {
                        await ref
                            .read(whatsappReminderServiceProvider)
                            .sendReminder(appointment, '+521111111111');
                      } catch (e) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text('Error: $e')));
                        }
                      }
                    },
                    icon: const Icon(Icons.message),
                    label: const Text('Enviar Recordatorio por WhatsApp'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                if (appointment.status == AppointmentStatus.pending ||
                    appointment.status == AppointmentStatus.confirmed)
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () async {
                        // Cancelar cita (Actualizamos el estado a cancelled)
                        final updated = appointment.copyWith(
                          status: AppointmentStatus.cancelled,
                        );
                        await ref
                            .read(saveAppointmentUseCaseProvider)
                            .call(updated);

                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Cita cancelada')),
                          );
                          context.pop();
                        }
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                      ),
                      child: const Text('Cancelar Cita'),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey.shade600),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
            ),
            Text(
              value,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}
