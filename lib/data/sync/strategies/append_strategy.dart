import 'package:cloud_firestore/cloud_firestore.dart';
import '../../local/database/app_database.dart';
import '../../local/daos/location_tracks_dao.dart';

// ESTRATEGIA DE CONFLICTO: BATCH APPEND-ONLY (SUBIDA EN LOTES DE COORDENADAS GPS)
//
// Usada en: Rastreo de ubicación del repartidor ('location_tracks').
//
// ¿Por qué es especial?
// El celular del chofer registra su ubicación GPS constantemente en ruta.
// Subir cada coordenada a internet de una en una consume muchísima batería y datos.
// Esta estrategia acumula los puntos GPS localmente (Offline) y los sube todos juntos
// en "paquetes" o "lotes" (WriteBatch) optimizados al volver a tener señal.
// Además, realiza una auto-limpieza periódica de almacenamiento en el celular.

class AppendStrategy {
  // Conector directo a la nube de Firestore
  final FirebaseFirestore _firestore;
  // Conector a la base de datos de rastreo local
  final LocationTracksDao _tracksDao;

  AppendStrategy(this._firestore, this._tracksDao);

  /// Sube en lote todas las ubicaciones GPS del repartidor que sigan pendientes.
  Future<void> uploadPendingTracks(String driverId) async {
    // 1. Obtenemos todas las coordenadas guardadas en el teléfono que aún no se han subido
    final pending = await _tracksDao.getPendingByDriver(driverId);
    if (pending.isEmpty)
      return; // Si no hay coordenadas nuevas, salimos temprano

    // 2. Agrupamos los puntos GPS según el ID del pedido ('orderId').
    // Esto es muy útil porque nos permite subir las coordenadas directo a la subcolección
    // del pedido correspondiente en internet.
    final byOrder = <String, List<LocationTracksTableData>>{};
    for (final track in pending) {
      byOrder.putIfAbsent(track.orderId, () => []).add(track);
    }

    // 3. Procesamos las coordenadas agrupadas por pedido
    for (final entry in byOrder.entries) {
      final orderId = entry.key;
      final tracks = entry.value;

      // Dividimos la lista de coordenadas en paquetes pequeños de 400 puntos.
      // ¿Por qué? Porque Google Firestore tiene un límite estricto de máximo 500 operaciones
      // por transacción (WriteBatch). Usar paquetes de 400 nos da un margen seguro de error.
      final batches = _chunked(tracks, 400);

      for (final chunk in batches) {
        // Creamos un "Lote de Escritura" (WriteBatch)
        final batch = _firestore.batch();

        for (final track in chunk) {
          // Apuntamos a la subcolección de rastreo del pedido en Firestore
          final ref = _firestore
              .collection('orders')
              .doc(orderId)
              .collection('tracking')
              .doc(track.id);

          // Preparamos la inserción en el lote
          batch.set(ref, _toMap(track));
        }

        // Ejecutamos la subida de todo el lote a internet de golpe
        await batch.commit();

        // 4. Tras subirse exitosamente a internet, marcamos esas coordenadas
        // localmente como sincronizadas ('synced') en SQLite.
        for (final track in chunk) {
          await _tracksDao.markSynced(track.id);
        }
      }
    }

    // 5. AUTO-LIMPIEZA: Borramos los registros de GPS con más de 7 días
    // que ya estén subidos para que no saturen la memoria de almacenamiento del celular.
    await _tracksDao.deleteOldSynced(keepDays: 7);
  }

  /// Función auxiliar: divide una lista en sublistas de tamaño [size] máximo.
  List<List<T>> _chunked<T>(List<T> list, int size) {
    return [
      for (var i = 0; i < list.length; i += size)
        list.sublist(i, i + size > list.length ? list.length : i + size),
    ];
  }

  /// Función auxiliar: convierte la fila de base de datos local
  /// en un mapa JSON listo para ser subido a Firebase Firestore.
  Map<String, dynamic> _toMap(LocationTracksTableData t) => {
    'id': t.id,
    'driverId': t.driverId,
    'orderId': t.orderId,
    'latitude': t.latitude,
    'longitude': t.longitude,
    'accuracyMeters': t.accuracyMeters,
    'speedKmh': t.speedKmh,
    'headingDegrees': t.headingDegrees,
    // Convertimos la fecha de Dart a formato Timestamp oficial de Firebase
    'recordedAt': Timestamp.fromDate(t.recordedAt),
    'syncVersion': t.syncVersion,
  };
}
