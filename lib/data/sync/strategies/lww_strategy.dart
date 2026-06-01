import 'package:cloud_firestore/cloud_firestore.dart';

// ESTRATEGIA DE CONFLICTO: LWW (LAST-WRITE-WINS - EL ÚLTIMO CAMBIO GANA)
//
// Usada en: Citas, Inventario de Productos, Usuarios, Mascotas y Pedidos.
//
// ¿Qué hace?
// Resuelve choques de datos comparando las fechas de actualización ('updatedAt').
// Por ejemplo: si modificas el nombre de un perrito en el teléfono mientras no tienes internet,
// y al mismo tiempo la veterinaria edita sus vacunas en internet, al volver la señal
// el sistema compara las fechas exactas. El que se haya guardado más recientemente gana
// y sobrescribe la versión más vieja.

class LwwStrategy {
  // Conector directo a la nube de Firestore
  final FirebaseFirestore _firestore;

  LwwStrategy(this._firestore);

  /// Compara las fechas y decide quién tiene el dato correcto (El celular o la Nube).
  ///
  /// Devuelve un resultado de tipo [ConflictResult].
  Future<ConflictResult> resolve({
    required String collection,
    required String docId,
    required DateTime localUpdatedAt,
    required int localSyncVersion,
    required Map<String, dynamic> localData,
  }) async {
    // 1. Buscamos el documento en la nube de Firestore
    final remoteDoc = await _firestore.collection(collection).doc(docId).get();

    // Caso A: Si el documento NO existe en internet, significa que es un registro
    // completamente nuevo hecho desde el celular. El local gana automáticamente.
    if (!remoteDoc.exists) return ConflictResult.localWins;

    // 2. Extraemos los datos técnicos guardados en la nube
    final remoteData = remoteDoc.data()!;
    final remoteUpdatedAt = (remoteData['updatedAt'] as Timestamp).toDate();
    final remoteSyncVersion = (remoteData['syncVersion'] as num?)?.toInt() ?? 0;

    // Caso B: Si tienen el mismo número de versión, significa que no hubo cambios reales
    // en ninguno de los dos lados. No hay conflicto.
    if (localSyncVersion == remoteSyncVersion) {
      return ConflictResult.noConflict;
    }

    // Caso C: El cambio con la fecha más reciente ('isAfter') gana la prioridad.
    // - Si el cambio local en el celular es más reciente → gana el celular (localWins).
    // - Si el cambio remoto en internet es más reciente → gana internet (remoteWins).
    return localUpdatedAt.isAfter(remoteUpdatedAt)
        ? ConflictResult.localWins
        : ConflictResult.remoteWins;
  }
}

/// [ConflictResult] define los tres caminos posibles tras comparar los datos.
enum ConflictResult {
  /// El cambio del celular es más nuevo y debe subirse a internet.
  localWins,

  /// El cambio de internet es más nuevo y debe guardarse en el celular.
  remoteWins,

  /// Los datos están idénticos, no es necesario hacer nada.
  noConflict,
}
