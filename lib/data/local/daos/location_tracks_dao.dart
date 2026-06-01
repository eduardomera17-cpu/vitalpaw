import 'package:drift/drift.dart';
import '../database/app_database.dart';
import '../tables/location_tracks_table.dart';

part 'location_tracks_dao.g.dart';

// CAJERO ESPECÍFICO DE RASTREO GPS (LOCATION TRACKS DAO)
//
// ⚠️ REGLA DE RENDIMIENTO (APPEND-ONLY ABSOLUTO):
// Esta clase registra los puntos del viaje del repartidor. Como son coordenadas continuas,
// solo permitimos insertar y leer. Nunca actualizamos ni borramos registros individuales históricos.
// Para no llenar la memoria del teléfono celular, implementamos una rutina de auto-limpieza
// para borrar coordenadas viejas que ya estén respaldadas en internet ('deleteOldSynced').

@DriftAccessor(tables: [LocationTracksTable])
class LocationTracksDao extends DatabaseAccessor<AppDatabase>
    with _$LocationTracksDaoMixin {
  LocationTracksDao(super.db);

  /// Guarda un único punto de ubicación en la base de datos del celular.
  Future<void> insertTrack(LocationTracksTableCompanion track) =>
      into(db.locationTracksTable).insert(track);

  /// Guarda múltiples puntos de ubicación a la vez (Batch Insert).
  /// Ahorra batería y recursos del teléfono al procesar todo en un solo paquete.
  Future<void> insertTracks(List<LocationTracksTableCompanion> tracks) =>
      batch((b) => b.insertAll(db.locationTracksTable, tracks));

  /// Obtiene los puntos GPS de un repartidor que aún no han sido enviados a internet.
  ///
  /// Los ordena cronológicamente según el momento en que el sensor GPS los capturó.
  Future<List<LocationTracksTableData>> getPendingByDriver(String driverId) =>
      (select(db.locationTracksTable)
            ..where(
              (t) =>
                  t.driverId.equals(driverId) & t.syncStatus.equals('pending'),
            )
            ..orderBy([(t) => OrderingTerm.asc(t.recordedAt)]))
          .get();

  /// Marca que un punto de ubicación ya se guardó con éxito en internet ('synced').
  Future<void> markSynced(String id) =>
      (update(db.locationTracksTable)..where((t) => t.id.equals(id))).write(
        LocationTracksTableCompanion(
          syncStatus: const Value('synced'),
          updatedAt: Value(DateTime.now()),
        ),
      );

  /// Rutina de Limpieza del Teléfono.
  ///
  /// Elimina de la base de datos local los puntos GPS que ya fueron sincronizados con la nube
  /// y que tienen una antigüedad mayor a [keepDays] (por defecto 7 días).
  /// Esto evita que el almacenamiento del celular del repartidor se llene con millones de coordenadas inútiles.
  Future<int> deleteOldSynced({int keepDays = 7}) {
    // Calculamos la fecha límite (hace 7 días)
    final cutoff = DateTime.now().subtract(Duration(days: keepDays));

    // Eliminamos físicamente las filas viejas sincronizadas
    return (delete(db.locationTracksTable)..where(
          (t) =>
              t.syncStatus.equals('synced') &
              t.recordedAt.isSmallerThanValue(cutoff),
        ))
        .go();
  }
}
