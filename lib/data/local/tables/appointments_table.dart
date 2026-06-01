import 'package:drift/drift.dart';
import 'pets_table.dart';
import 'users_table.dart';

// DEFINICIÓN DE LA TABLA DE CITAS (TABLA DRIFT)
// Esta clase le dice a SQLite cómo estructurar la agenda de turnos de la veterinaria.
// Controla citas para estética, consultas veterinarias, etc.

class AppointmentsTable extends Table {
  @override
  String get tableName => 'appointments';

  // COLUMNAS DE LA TABLA

  /// Identificador único de la cita (UUID largo).
  TextColumn get id => text()();

  /// La mascota que asistirá a la cita.
  /// Relaciona esta columna con la tabla 'PetsTable'.
  TextColumn get petId => text().references(PetsTable, #id)();

  /// El cliente (dueño de la mascota) que solicita la cita.
  /// Relaciona con la tabla 'UsersTable'.
  TextColumn get clientId => text().references(UsersTable, #id)();

  /// El empleado o veterinario asignado para atender esta cita (puede ser nulo al inicio).
  /// Relaciona con la tabla 'UsersTable'.
  TextColumn get staffId => text().references(UsersTable, #id).nullable()();

  /// Tipo de servicio solicitado.
  /// Valores comunes: 'vet' (consulta médica), 'grooming' (corte de pelo), 'boarding' (hospedaje), 'bath' (baño).
  TextColumn get serviceType => text()();

  /// Estado de la cita (por defecto es 'pending').
  /// Valores: 'pending' (pendiente), 'confirmed' (confirmada), 'in_progress' (en atención),
  /// 'completed' (finalizada), 'cancelled' (cancelada).
  TextColumn get status => text().withDefault(const Constant('pending'))();

  /// Fecha y hora exacta programada para la cita.
  DateTimeColumn get scheduledAt => dateTime()();

  /// Duración aproximada de la cita en minutos (por defecto 60 minutos).
  IntColumn get durationMinutes => integer().withDefault(const Constant(60))();

  /// Costo estimado o final del servicio cobrado al cliente.
  RealColumn get price => real().nullable()();

  /// Indicaciones, síntomas iniciales reportados o comentarios del cliente/recepcionista.
  TextColumn get notes => text().nullable()();

  /// Indica si ya se le envió una notificación o alarma interna de recordatorio (por defecto falso).
  BoolColumn get reminderSent => boolean().withDefault(const Constant(false))();

  /// Indica si ya se le envió el recordatorio automatizado por WhatsApp al cliente (por defecto falso).
  BoolColumn get whatsappSent => boolean().withDefault(const Constant(false))();

  // METADATOS DE SINCRONIZACIÓN (OBLIGATORIOS)
  // Permiten agendar citas sin internet y subirlas a la nube cuando regrese la señal.

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  TextColumn get syncStatus => text().withDefault(const Constant('pending'))();
  IntColumn get syncVersion => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}
