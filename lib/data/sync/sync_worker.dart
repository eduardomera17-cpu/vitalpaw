// ignore_for_file: prefer_initializing_formals

import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers/database_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'connectivity_monitor.dart';
import 'sync_dispatcher.dart';

// ESTADOS DEL MOTOR DE SINCRONIZACIÓN
enum SyncState {
  /// El motor está inactivo o esperando cambios.
  idle,

  /// El motor está subiendo datos activamente en este segundo.
  syncing,

  /// Ocurrió un fallo en la conexión y se detuvo la subida.
  error,
}

// PROVEEDOR DE FIRESTORE
/// Conector oficial de Firestore expuesto para ser usado por el despachador.
final firestoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

// EL TRABAJADOR DE FONDO (SYNC WORKER)
// Piensa en el 'SyncWorker' como un "asistente personal" que trabaja en segundo plano.
// Su única misión en la vida es estar atento a lo que haga el "sensor de internet" (ConnectivityMonitor).
// - Si te quedas sin señal, se pone a dormir.
// - En el instante en que tu celular recupera señal, se despierta solo y sube todas las mascotas
//   y compras pendientes para que no tengas que preocuparte de nada.

class SyncWorker {
  // El ejecutor de subidas
  final SyncDispatcher _dispatcher;
  // El sensor de internet
  final ConnectivityMonitor _connectivity;

  // Suscripción interna para escuchar al sensor de red
  StreamSubscription<NetworkStatus>? _subscription;
  // Estado actual del worker
  SyncState _state = SyncState.idle;
  // El último reporte de sincronización generado
  SyncReport? _lastReport;
  // Fecha y hora del último proceso de sincronización exitoso
  DateTime? _lastSyncAt;
  // Identificador de repartidor (si el usuario actual es chofer)
  String? _currentDriverId;

  SyncWorker({
    required SyncDispatcher dispatcher,
    required ConnectivityMonitor connectivity,
  }) : _dispatcher = dispatcher,
       _connectivity = connectivity;

  SyncState get state => _state;
  SyncReport? get lastReport => _lastReport;
  DateTime? get lastSyncAt => _lastSyncAt;

  /// Enciende el motor de sincronización.
  ///
  /// Se llama automáticamente cuando el usuario inicia sesión.
  /// Comienza a escuchar al sensor de internet en tiempo real.
  void start({String? driverId}) {
    _currentDriverId = driverId;

    // 1. Sincronizamos inmediatamente al iniciar si el teléfono ya tiene internet
    _connectivity.currentStatus.then((status) {
      if (status == NetworkStatus.online) _runSync();
    });

    // 2. Nos suscribimos al sensor para reaccionar cada vez que el internet regrese
    _subscription = _connectivity.statusStream.listen((status) {
      // Si el internet regresó ('online') y el motor no estaba ocupado, arrancamos
      if (status == NetworkStatus.online && _state == SyncState.idle) {
        _runSync();
      }
    });
  }

  /// Apaga el motor y cancela las escuchas (evita fugas de batería y memoria).
  void stop() {
    _subscription?.cancel();
    _subscription = null;
  }

  /// Dispara una sincronización manual (ej: al hacer clic en el botón "Sincronizar ahora" en la pantalla).
  /// Devuelve el reporte de subida o 'null' si no hay conexión de internet.
  Future<SyncReport?> syncNow() async {
    final status = await _connectivity.currentStatus;
    if (status == NetworkStatus.offline)
      return null; // No hay señal, no hacemos nada
    return _runSync();
  }

  /// Ejecuta el proceso de sincronización protegiéndose de ejecuciones duplicadas.
  Future<SyncReport?> _runSync() async {
    // Si ya se estaba ejecutando una subida, ignoramos esta petición para no duplicar datos
    if (_state == SyncState.syncing) return null;

    _state = SyncState.syncing;
    try {
      // Mandamos al despachador a subir todo ordenadamente
      final report = await _dispatcher.dispatchAll(
        currentDriverId: _currentDriverId,
      );

      _lastReport = report;
      _lastSyncAt = DateTime.now();
      _state = SyncState.idle; // Volvemos a reposo
      return report;
    } catch (e) {
      _state = SyncState.error; // Marcamos error si falló la red
      return null;
    }
  }

  /// Método destructor para limpieza interna.
  void dispose() => stop();
}

// PROVEEDORES DE RIVERPOD

/// [syncDispatcherProvider] configura el despachador inyectándole todos los DAOs de base de datos.
final syncDispatcherProvider = Provider<SyncDispatcher>((ref) {
  return SyncDispatcher(
    firestore: ref.watch(firestoreProvider),
    usersDao: ref.watch(usersDaoProvider),
    petsDao: ref.watch(petsDaoProvider),
    appointmentsDao: ref.watch(appointmentsDaoProvider),
    medicalRecordsDao: ref.watch(medicalRecordsDaoProvider),
    productsDao: ref.watch(productsDaoProvider),
    ordersDao: ref.watch(ordersDaoProvider),
    tracksDao: ref.watch(locationTracksDaoProvider),
  );
});

/// [syncWorkerProvider] inicializa el worker de fondo y lo mantiene vivo.
final syncWorkerProvider = Provider<SyncWorker>((ref) {
  final worker = SyncWorker(
    dispatcher: ref.watch(syncDispatcherProvider),
    connectivity: ref.watch(connectivityMonitorProvider),
  );
  ref.onDispose(worker.dispose); // Auto-limpieza
  return worker;
});

/// [SyncStateNotifier] es una pequeña "pantalla de aviso" de Riverpod.
/// Permite que cualquier elemento visual de la app se entere en qué estado está
/// el worker (girando el Badge de la AppBar si está subiendo datos, por ejemplo).
class SyncStateNotifier extends Notifier<SyncState> {
  @override
  SyncState build() => SyncState.idle;

  void updateState(SyncState newState) {
    state = newState;
  }
}

/// Proveedor para vigilar reactivamente el estado de carga del worker.
final syncStateProvider = NotifierProvider<SyncStateNotifier, SyncState>(
  SyncStateNotifier.new,
);
