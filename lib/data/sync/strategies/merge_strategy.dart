import 'package:cloud_firestore/cloud_firestore.dart';

// ESTRATEGIA DE CONFLICTO: MERGE ASISTIDO (FUSIÓN MANUAL DE EXPEDIENTES)
//
// Usada únicamente en: Historial Médico ('medical_records').
//
// ¿Por qué existe esta estrategia tan estricta?
// Los datos de salud de una mascota (alergias, cirugías, dosis) son críticos.
// Si un veterinario prescribe un antibiótico en su celular sin internet, y al mismo tiempo
// otro veterinario actualiza el peso y receta otra medicina desde internet, sobrescribir
// uno con otro de forma silenciosa (como en LWW) sería muy peligroso.
//
// Por lo tanto, si las versiones no coinciden, marcamos un "Conflicto"
// para que un administrador del sistema los fusione manualmente de forma segura.

class MergeStrategy {
  // Conector directo a la nube de Firestore
  final FirebaseFirestore _firestore;

  MergeStrategy(this._firestore);

  /// Evalúa el estado del registro médico local frente al de la nube.
  ///
  /// Devuelve un [MergeResult] indicando si es seguro subirlo, si no hay cambios o si chocó.
  Future<MergeResult> evaluate({
    required String petId,
    required String recordId,
    required int localSyncVersion,
    required Map<String, dynamic> localData,
  }) async {
    // 1. Buscamos la nota médica en la nube de Firestore (dentro de la subcolección de la mascota)
    final remoteDoc = await _firestore
        .collection('pets')
        .doc(petId)
        .collection('medical_records')
        .doc(recordId)
        .get();

    // Caso A: Si la nota no existe en internet, significa que es una nota médica nueva
    // redactada en el teléfono. Es 100% seguro subirla sin problemas ('safe').
    if (!remoteDoc.exists) return MergeResult.safe;

    // 2. Extraemos los datos técnicos guardados en internet
    final remoteData = remoteDoc.data()!;
    final remoteSyncVersion = (remoteData['syncVersion'] as num?)?.toInt() ?? 0;

    // Caso B: Si tienen el mismo número de versión de sincronización,
    // significa que no ha habido cambios en internet. No hay conflicto ('noChange').
    if (localSyncVersion == remoteSyncVersion) return MergeResult.noChange;

    // Caso C: Si las versiones difieren, ¡HAY CONFLICTO!
    // Alguien modificó la nota en internet y también en el teléfono por separado.
    // Detenemos cualquier actualización automática para no borrar el diagnóstico de nadie
    // y devolvemos 'conflict' para que lo resuelva un humano.
    return MergeResult.conflict;
  }
}

/// [MergeResult] define los tres estados posibles al analizar el historial médico.
enum MergeResult {
  /// Es seguro subir el cambio (no existe en internet).
  safe,

  /// No hay cambios reales, las versiones son idénticas.
  noChange,

  /// Chocó. Requiere intervención humana del administrador en la web.
  conflict,
}
