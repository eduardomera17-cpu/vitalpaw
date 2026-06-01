import 'package:equatable/equatable.dart';

/// Define los tipos de servicios que ofrece la veterinaria.
enum AppointmentServiceType {
  /// Consulta veterinaria general.
  vet,

  /// Servicio de peluquería y estética.
  grooming,

  /// Servicio de hospedaje.
  boarding,

  /// Solo baño.
  bath,

  /// Otro tipo de servicio.
  other,
}

/// Define los posibles estados de una cita.
enum AppointmentStatus {
  /// La cita ha sido solicitada pero aún no se atiende.
  pending,

  /// La cita fue confirmada por el cliente/staff.
  confirmed,

  /// La mascota está siendo atendida en este momento.
  inProgress,

  /// El servicio ya terminó.
  completed,

  /// La cita fue cancelada.
  cancelled,
}

/// Entidad pura del Dominio que representa una Cita o Turno.
/// Esta clase es independiente de SQLite o Firebase.
class Appointment extends Equatable {
  /// Identificador único de la cita.
  final String id;

  /// Identificador de la mascota a atender.
  final String petId;

  /// Identificador del cliente (dueño).
  final String clientId;

  /// Identificador del veterinario/staff (puede ser nulo si no está asignado).
  final String? staffId;

  /// Tipo de servicio (veterinaria, peluquería, etc.).
  final AppointmentServiceType serviceType;

  /// Estado actual de la cita.
  final AppointmentStatus status;

  /// Fecha y hora exacta programada para la cita.
  final DateTime scheduledAt;

  /// Duración estimada de la cita en minutos (ej: 60).
  final int durationMinutes;

  /// Precio estimado o cobrado (opcional).
  final double? price;

  /// Notas adicionales, síntomas o comentarios.
  final String? notes;

  /// Indica si ya se activó la alarma local de recordatorio en el dispositivo.
  final bool reminderSent;

  /// Indica si ya se le envió el mensaje de recordatorio por WhatsApp al cliente.
  final bool whatsappSent;

  const Appointment({
    required this.id,
    required this.petId,
    required this.clientId,
    this.staffId,
    required this.serviceType,
    this.status = AppointmentStatus.pending,
    required this.scheduledAt,
    this.durationMinutes = 60,
    this.price,
    this.notes,
    this.reminderSent = false,
    this.whatsappSent = false,
  });

  /// Crea una copia exacta de esta cita, pero permitiendo modificar
  /// algunos valores específicos (muy útil para actualizar el estado).
  Appointment copyWith({
    String? id,
    String? petId,
    String? clientId,
    String? staffId,
    AppointmentServiceType? serviceType,
    AppointmentStatus? status,
    DateTime? scheduledAt,
    int? durationMinutes,
    double? price,
    String? notes,
    bool? reminderSent,
    bool? whatsappSent,
  }) {
    return Appointment(
      id: id ?? this.id,
      petId: petId ?? this.petId,
      clientId: clientId ?? this.clientId,
      staffId: staffId ?? this.staffId,
      serviceType: serviceType ?? this.serviceType,
      status: status ?? this.status,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      price: price ?? this.price,
      notes: notes ?? this.notes,
      reminderSent: reminderSent ?? this.reminderSent,
      whatsappSent: whatsappSent ?? this.whatsappSent,
    );
  }

  @override
  List<Object?> get props => [
    id,
    petId,
    clientId,
    staffId,
    serviceType,
    status,
    scheduledAt,
    durationMinutes,
    price,
    notes,
    reminderSent,
    whatsappSent,
  ];
}
