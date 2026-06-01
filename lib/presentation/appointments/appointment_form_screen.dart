import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../../domain/appointments/entities/appointment.dart';
import '../auth/providers/auth_providers.dart';
import 'providers/appointment_providers.dart';
import 'widgets/time_slot_picker.dart';

/// Pantalla para crear o editar una cita.
///
/// Permite seleccionar el servicio, la mascota, y el horario de la cita.
class AppointmentFormScreen extends ConsumerStatefulWidget {
  /// Si es null, estamos creando una nueva cita.
  final String? appointmentId;

  /// Fecha inicial seleccionada desde el calendario (opcional).
  final DateTime? preselectedDate;

  const AppointmentFormScreen({
    super.key,
    this.appointmentId,
    this.preselectedDate,
  });

  @override
  ConsumerState<AppointmentFormScreen> createState() =>
      _AppointmentFormScreenState();
}

class _AppointmentFormScreenState extends ConsumerState<AppointmentFormScreen> {
  final _formKey = GlobalKey<FormState>();

  AppointmentServiceType _selectedService = AppointmentServiceType.vet;
  DateTime _selectedDate = DateTime.now();
  String? _selectedTimeSlot;

  // En un caso real, estas listas vendrían de la base de datos (Drift) o de Riverpod.
  final List<String> _mockPets = [
    'pet_1_Firulais',
    'pet_2_Michi',
    'pet_3_Lola',
  ];
  String? _selectedPetId;

  final TextEditingController _notesController = TextEditingController();

  // Generamos horas disponibles de 9:00 a 17:00 cada 30 mins
  List<String> get _availableSlots {
    List<String> slots = [];
    for (int i = 9; i < 18; i++) {
      slots.add('${i.toString().padLeft(2, '0')}:00');
      slots.add('${i.toString().padLeft(2, '0')}:30');
    }
    return slots;
  }

  @override
  void initState() {
    super.initState();
    if (widget.preselectedDate != null) {
      _selectedDate = widget.preselectedDate!;
    }
    _selectedPetId = _mockPets.first; // Seleccionar primera mascota por defecto
    // TODO: Si appointmentId != null, deberíamos cargar la cita existente para editarla.
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _selectedTimeSlot = null; // Reseteamos la hora al cambiar de día
      });
    }
  }

  Future<void> _saveAppointment() async {
    if (_formKey.currentState!.validate()) {
      if (_selectedTimeSlot == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Por favor selecciona una hora para la cita'),
          ),
        );
        return;
      }

      // Combinamos la fecha y hora seleccionada
      final timeParts = _selectedTimeSlot!.split(':');
      final hour = int.parse(timeParts[0]);
      final minute = int.parse(timeParts[1]);
      final finalDateTime = DateTime(
        _selectedDate.year,
        _selectedDate.month,
        _selectedDate.day,
        hour,
        minute,
      );

      final currentUser = ref.read(authStateProvider).value;
      if (currentUser == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error: No hay usuario autenticado')),
        );
        return;
      }

      // Creamos la entidad
      final newAppointment = Appointment(
        id: widget.appointmentId ?? const Uuid().v4(),
        petId: _selectedPetId!,
        clientId: currentUser.id,
        serviceType: _selectedService,
        scheduledAt: finalDateTime,
        durationMinutes: 30, // Asumimos 30 min por defecto
        notes: _notesController.text,
        status: AppointmentStatus
            .confirmed, // Si lo crea el cliente, podría ser pending.
      );

      try {
        // Guardamos usando el caso de uso
        await ref.read(saveAppointmentUseCaseProvider).call(newAppointment);

        // Programamos alarma local si faltan más de 60 mins
        await ref
            .read(pushNotificationServiceProvider)
            .scheduleAppointmentReminder(newAppointment, minutesBefore: 60);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Cita guardada correctamente')),
          );
          context.pop(); // Volver a la agenda
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Error al guardar: $e')));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.appointmentId == null ? 'Agendar Cita' : 'Editar Cita',
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Selección de Mascota
              const Text(
                'Mascota',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                initialValue: _selectedPetId,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                items: _mockPets.map((pet) {
                  return DropdownMenuItem(
                    value: pet,
                    child: Text(
                      pet.split('_').last,
                    ), // Mostramos solo el nombre
                  );
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    _selectedPetId = val;
                  });
                },
              ),
              const SizedBox(height: 20),

              // Selección de Servicio
              const Text(
                'Servicio',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<AppointmentServiceType>(
                initialValue: _selectedService,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                items: AppointmentServiceType.values.map((service) {
                  return DropdownMenuItem(
                    value: service,
                    child: Text(service.name.toUpperCase()),
                  );
                }).toList(),
                onChanged: (val) {
                  if (val != null) setState(() => _selectedService = val);
                },
              ),
              const SizedBox(height: 20),

              // Selección de Fecha
              const Text(
                'Fecha',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              InkWell(
                onTap: () => _selectDate(context),
                child: InputDecorator(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(DateFormat('dd/MM/yyyy').format(_selectedDate)),
                      const Icon(Icons.calendar_today),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Selección de Hora
              const Text(
                'Horarios Disponibles',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              TimeSlotPicker(
                availableSlots: _availableSlots,
                selectedSlot: _selectedTimeSlot,
                onSlotSelected: (slot) {
                  setState(() => _selectedTimeSlot = slot);
                },
              ),
              const SizedBox(height: 20),

              // Notas
              const Text(
                'Notas (opcional)',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _notesController,
                maxLines: 3,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Ej. Necesita corte de uñas...',
                ),
              ),
              const SizedBox(height: 30),

              // Botón Guardar
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _saveAppointment,
                  child: const Text(
                    'Confirmar Cita',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
