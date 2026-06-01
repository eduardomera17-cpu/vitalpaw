import 'package:drift/drift.dart';
import 'pets_table.dart';
import 'users_table.dart';

// DEFINICIÓN DE LA TABLA DE HISTORIAL MÉDICO (TABLA DRIFT)
// Esta clase le dice a SQLite cómo estructurar el expediente de salud de cada mascota.
//
// ⚠️ REGLA DE ORO LEGAL VETERINARIA (APPEND-ONLY):
// Los historiales médicos no se pueden "modificar" ni "borrar" para evitar fraudes u omisiones.
// Si el veterinario cometió un error en un diagnóstico, no edita el registro viejo.
// En su lugar, inserta un registro nuevo con una nota aclaratoria o de rectificación.

class MedicalRecordsTable extends Table {
  @override
  String get tableName => 'medical_records';

  // COLUMNAS DE LA TABLA

  /// Identificador único del registro médico (UUID largo).
  TextColumn get id => text()();

  /// La mascota a la que le pertenece este registro médico.
  /// Relaciona con la tabla 'PetsTable'.
  TextColumn get petId => text().references(PetsTable, #id)();

  /// El veterinario (usuario de la app) que atendió la consulta y redactó la nota.
  /// Relaciona con la tabla 'UsersTable'.
  TextColumn get vetId => text().references(UsersTable, #id)();

  /// El tipo de evento médico registrado.
  /// Valores permitidos:
  /// - 'vaccine' (vacuna), 'deworming' (desparasitante), 'weight_check' (control de peso),
  /// - 'diagnosis' (diagnóstico/enfermedad), 'surgery' (cirugía), 'prescription' (receta médica),
  /// - 'general_note' (observación general).
  TextColumn get recordType => text()();

  /// Título breve del registro (ej. "Vacuna Quíntuple", "Otitis bilateral").
  TextColumn get title => text()();

  /// Explicación detallada de lo encontrado en la revisión o indicaciones médicas.
  TextColumn get description => text()();

  /// Peso de la mascota tomado en esta consulta en específico (para ver la evolución de peso).
  RealColumn get weightKg => real().nullable()();

  /// Nombre del medicamento recetado o aplicado (si aplica).
  TextColumn get medicationName => text().nullable()();

  /// Dosis y frecuencia del medicamento (ej. "1 tableta cada 12 horas por 5 días").
  TextColumn get dosage => text().nullable()();

  /// Fecha de la siguiente cita o aplicación.
  /// Muy útil para vacunas (ej. cuándo toca el refuerzo en 6 meses).
  DateTimeColumn get nextDueDate => dateTime().nullable()();

  /// Ruta de una foto del examen o receta guardada localmente en el celular.
  TextColumn get attachmentLocalPath => text().nullable()();

  /// Enlace de internet de la foto del examen guardada en la nube.
  TextColumn get attachmentRemoteUrl => text().nullable()();

  /// Notas aclaratorias escritas por el administrador si hubo un choque o conflicto
  /// al sincronizar los datos locales con el servidor (Merge Asistido).
  TextColumn get conflictNotes => text().nullable()();

  // METADATOS DE SINCRONIZACIÓN (OBLIGATORIOS)
  // syncStatus en esta tabla puede ser:
  // - 'pending': esperando subir a la nube.
  // - 'synced': guardado exitosamente.
  // - 'conflict': chocó con un cambio remoto. El administrador del negocio resolverá el conflicto.

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  /// deletedAt se usa de manera virtual para marcar que una nota médica fue "anulada" por error.
  /// Pero recuerda: NUNCA se borra físicamente la fila de la base de datos.
  DateTimeColumn get deletedAt => dateTime().nullable()();

  TextColumn get syncStatus => text().withDefault(const Constant('pending'))();
  IntColumn get syncVersion => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}
