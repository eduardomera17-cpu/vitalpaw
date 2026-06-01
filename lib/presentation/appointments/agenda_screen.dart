import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'providers/appointment_providers.dart';
import 'widgets/appointment_card.dart';
import 'widgets/calendar_week_view.dart';

/// Pantalla principal de la agenda.
///
/// Muestra un calendario semanal en la parte superior y la lista de citas
/// programadas para el día seleccionado en la parte inferior.
class AgendaScreen extends ConsumerStatefulWidget {
  const AgendaScreen({super.key});

  @override
  ConsumerState<AgendaScreen> createState() => _AgendaScreenState();
}

class _AgendaScreenState extends ConsumerState<AgendaScreen> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    // Escuchamos el proveedor que trae las citas del día seleccionado
    final appointmentsAsync = ref
        .watch(watchAppointmentsByDateUseCaseProvider)
        .call(_selectedDate);

    // En una app real, usaríamos ref.watch(authStateProvider) para
    // verificar el usuario actual y ajustar la UI según su rol.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda Pet Shop'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // Simplemente refrescamos forzando reconstrucción (Riverpod ya maneja el stream)
              setState(() {});
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Vista del calendario semanal (Week View)
          CalendarWeekView(
            selectedDate: _selectedDate,
            onDateSelected: (date) {
              setState(() {
                _selectedDate = date;
              });
            },
          ),

          const Divider(height: 1),

          // Título de la sección de la lista
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Citas del día',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
          ),

          // Lista reactiva de citas (StreamBuilder implícito de Riverpod)
          Expanded(
            child: StreamBuilder(
              stream: appointmentsAsync,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                final appointments = snapshot.data ?? [];

                if (appointments.isEmpty) {
                  return const Center(
                    child: Text('No hay citas programadas para este día.'),
                  );
                }

                return ListView.builder(
                  itemCount: appointments.length,
                  itemBuilder: (context, index) {
                    final appointment = appointments[index];
                    return AppointmentCard(
                      appointment: appointment,
                      onTap: () {
                        // Navega a la pantalla de detalle de la cita
                        context.push('/appointments/detail/${appointment.id}');
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      // Botón flotante para agendar nueva cita (Visible para staff y clientes)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navega al formulario para crear cita, pasándole el día preseleccionado
          context.push('/appointments/new', extra: _selectedDate);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
