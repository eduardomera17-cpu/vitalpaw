import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// MONITOR DE CONECTIVIDAD DE RED (CONNECTIVITY MONITOR)
// Este componente funciona como un "sensor de internet" para la aplicación.
// Está todo el tiempo atento para saber si el celular está conectado a internet (WiFi o Datos móviles)
// o si se quedó sin señal (Offline), avisando al motor de sincronización para que actúe de inmediato.

/// [NetworkStatus] reduce los estados de conexión a solo dos opciones claras.
enum NetworkStatus {
  /// Conectado a internet (WiFi o Datos).
  online,

  /// Desconectado de internet (Sin red).
  offline,
}

class ConnectivityMonitor {
  // Conector a la librería nativa del celular
  final Connectivity _connectivity;
  // Un canal interno (StreamController) para transmitir el estado de red a toda la app.
  // Es 'broadcast' para que múltiples partes puedan escucharlo al mismo tiempo.
  final _controller = StreamController<NetworkStatus>.broadcast();

  // Si no se le pasa un conector Connectivity personalizado (ej. para pruebas),
  // por defecto inicia la conexión real del sistema.
  ConnectivityMonitor({Connectivity? connectivity})
    : _connectivity = connectivity ?? Connectivity() {
    _init();
  }

  /// Inicializa la escucha automática de red.
  void _init() {
    // Escuchamos el stream nativo del sistema que nos avisa si el estado físico de la red cambia
    _connectivity.onConnectivityChanged.listen((results) {
      // Si alguno de los resultados es distinto a 'none' (ninguno), significa que hay internet
      final status = results.any((r) => r != ConnectivityResult.none)
          ? NetworkStatus.online
          : NetworkStatus.offline;

      // Enviamos el estado por nuestro canal interno para avisar a los interesados
      _controller.add(status);
    });
  }

  /// Expone el canal de actualizaciones en vivo (Stream) para que la app sepa cuándo cambia el internet.
  Stream<NetworkStatus> get statusStream => _controller.stream;

  /// Consulta única e instantánea para saber el estado de red en este preciso segundo.
  Future<NetworkStatus> get currentStatus async {
    final results = await _connectivity.checkConnectivity();
    return results.any((r) => r != ConnectivityResult.none)
        ? NetworkStatus.online
        : NetworkStatus.offline;
  }

  /// Limpia y cierra el canal al apagar la app para evitar fugas de memoria.
  void dispose() => _controller.close();
}

// PROVEEDORES DE RIVERPOD

/// [connectivityMonitorProvider] expone una única instancia del monitor de red para toda la app.
final connectivityMonitorProvider = Provider<ConnectivityMonitor>((ref) {
  final monitor = ConnectivityMonitor();
  ref.onDispose(monitor.dispose); // Se asegura de cerrarlo al destruirse
  return monitor;
});

/// [networkStatusProvider] es un StreamProvider reactivo.
/// Permite que cualquier parte visual de la app (Widgets) se mantenga escuchando
/// el estado de internet. Por ejemplo, sirve para pintar una barra roja en la pantalla
/// que diga "Sin conexión" cuando el teléfono se quede sin señal.
final networkStatusProvider = StreamProvider<NetworkStatus>((ref) {
  return ref.watch(connectivityMonitorProvider).statusStream;
});
