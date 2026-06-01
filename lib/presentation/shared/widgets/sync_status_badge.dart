import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/sync/connectivity_monitor.dart';
import '../../../data/sync/sync_worker.dart';

// EL INDICADOR VISUAL DE SINCRONIZACIÓN (SYNC STATUS BADGE)
// Este widget dibuja un icono pequeño de nube en la barra superior (AppBar) de la app.
// Le permite al usuario saber en todo momento si su celular está guardando datos offline
// o si ya se sincronizaron con internet, dando una experiencia premium y transparente.

class SyncStatusBadge extends ConsumerWidget {
  const SyncStatusBadge({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Escuchamos el estado del sensor de internet y del motor de sincronización
    final networkStatus = ref.watch(networkStatusProvider);
    final syncState = ref.watch(syncStateProvider);

    // .when() nos ayuda a manejar las tres respuestas posibles del sensor Stream de forma ordenada:
    return networkStatus.when(
      // Caso 1: Obtuvimos datos de red exitosamente
      data: (status) {
        // A. Si el celular se quedó sin señal (Offline):
        // Mostramos una nube naranja tachada. Al dejar presionado el icono (Tooltip),
        // se le avisa al usuario que puede seguir usando la app sin problemas.
        if (status == NetworkStatus.offline) {
          return const Tooltip(
            message:
                'Sin conexión — tus datos están seguros guardados en el teléfono.',
            child: Icon(Icons.cloud_off_outlined, color: Colors.orange),
          );
        }

        // B. Si hay internet y el motor está subiendo archivos en este milisegundo (Syncing):
        // Reemplazamos la nube por un círculo de carga giratorio azul para indicar actividad.
        if (syncState == SyncState.syncing) {
          return const SizedBox(
            width: 18,
            height: 18,
            child: CircularProgressIndicator(strokeWidth: 2),
          );
        }

        // C. Si hay internet y todo está guardado a salvo en la nube:
        // Dibujamos una hermosa nube verde con una palomita que transmite paz y seguridad.
        return const Tooltip(
          message: 'Todo sincronizado y al día con el servidor.',
          child: Icon(Icons.cloud_done_outlined, color: Colors.green),
        );
      },
      // Caso 2: El sensor está arrancando
      loading: () =>
          const SizedBox.shrink(), // Ocultamos el icono mientras carga
      // Caso 3: Ocurrió un error inesperado al leer el sensor
      error: (_, _) => const Icon(Icons.cloud_off_outlined, color: Colors.red),
    );
  }
}
