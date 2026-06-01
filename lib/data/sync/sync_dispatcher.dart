// ignore_for_file: prefer_initializing_formals

import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drift/drift.dart'; // Importante para la clase 'Value' de Drift
import '../local/database/app_database.dart';
import '../local/daos/users_dao.dart';
import '../local/daos/pets_dao.dart';
import '../local/daos/appointments_dao.dart';
import '../local/daos/medical_records_dao.dart';
import '../local/daos/products_dao.dart';
import '../local/daos/orders_dao.dart';
import '../local/daos/location_tracks_dao.dart';
import 'strategies/lww_strategy.dart';
import 'strategies/merge_strategy.dart';
import 'strategies/append_strategy.dart';

// EL DESPACHADOR DE SINCRONIZACIÓN (SYNC DISPATCHER)
// Este es el corazón del motor "Offline-First" de nuestra veterinaria.
// Se encarga de tomar todos los registros creados o modificados sin internet
// y subirlos ordenadamente a internet (Google Firestore) de forma resiliente.
//
// Sigue un "Orden de Dependencia" muy estricto para evitar errores en el servidor:
// 1. Usuarios (Dueños) -> 2. Mascotas -> 3. Citas -> 4. Productos -> 5. Pedidos -> 6. Historial Médico -> 7. GPS.
// Esto garantiza que nunca intentemos subir una mascota si su dueño aún no existe en el servidor.

class SyncDispatcher {
  // Conectores a la base de datos de internet (Firestore)
  final FirebaseFirestore _firestore;

  // Cajeros locales de datos (DAOs) para leer y marcar como sincronizados
  final UsersDao _usersDao;
  final PetsDao _petsDao;
  final AppointmentsDao _appointmentsDao;
  final MedicalRecordsDao _medicalRecordsDao;
  final ProductsDao _productsDao;
  final OrdersDao _ordersDao;
  final LocationTracksDao _tracksDao;

  // Estrategias avanzadas para resolver choques de datos (conflictos)
  late final LwwStrategy _lww;
  late final MergeStrategy _merge;
  late final AppendStrategy _append;

  SyncDispatcher({
    required FirebaseFirestore firestore,
    required UsersDao usersDao,
    required PetsDao petsDao,
    required AppointmentsDao appointmentsDao,
    required MedicalRecordsDao medicalRecordsDao,
    required ProductsDao productsDao,
    required OrdersDao ordersDao,
    required LocationTracksDao tracksDao,
  }) : _firestore = firestore,
       _usersDao = usersDao,
       _petsDao = petsDao,
       _appointmentsDao = appointmentsDao,
       _medicalRecordsDao = medicalRecordsDao,
       _productsDao = productsDao,
       _ordersDao = ordersDao,
       _tracksDao = tracksDao {
    // Inicializamos las estrategias de conflicto
    _lww = LwwStrategy(_firestore);
    _merge = MergeStrategy(_firestore);
    _append = AppendStrategy(_firestore, _tracksDao);
  }

  /// [dispatchAll] es la función principal que enciende el motor.
  ///
  /// Sube de forma ultra-organizada todas las tablas una tras otra.
  /// Si el usuario es un repartidor en camino, también sube sus coordenadas GPS ([currentDriverId]).
  /// Al finalizar, nos entrega un reporte detallado ([SyncReport]).
  Future<SyncReport> dispatchAll({String? currentDriverId}) async {
    final report = SyncReport();

    // Sigue el orden estricto de dependencias (FIFO Jerárquico)
    await _dispatchUsers(report);
    await _dispatchPets(report);
    await _dispatchAppointments(report);
    await _dispatchProducts(report);
    await _dispatchOrders(report);
    await _dispatchMedicalRecords(report);

    // Si hay un chofer asignado, subimos en paquete sus coordenadas de rastreo GPS
    if (currentDriverId != null) {
      await _append.uploadPendingTracks(currentDriverId);
      report.tracksSynced = true;
    }

    return report;
  }

  // ── 1. USUARIOS (USERS) ───────────────────────────────────────────────────

  /// Toma los perfiles de usuario modificados localmente y los sube a la nube.
  Future<void> _dispatchUsers(SyncReport report) async {
    final pending = await _usersDao.getPendingSync();
    for (final user in pending) {
      final data = _userToMap(user);

      // Aplicamos la estrategia LWW (El cambio más reciente gana)
      final result = await _lww.resolve(
        collection: 'users',
        docId: user.id,
        localUpdatedAt: user.updatedAt,
        localSyncVersion: user.syncVersion,
        localData: data,
      );

      // Si ganamos nosotros localmente o no hay conflicto, subimos el perfil a la nube
      if (result == ConflictResult.localWins ||
          result == ConflictResult.noConflict) {
        await _uploadWithBackoff(
          () => _firestore.collection('users').doc(user.id).set(data),
        );
        // Marcamos en la base de datos local que ya está a salvo en la nube
        await _usersDao.markSynced(user.id);
        report.usersSynced++;
      } else {
        // Si internet tiene datos más nuevos (remoteWins), descargamos esa versión y actualizamos el celular
        await _downloadAndUpdateUser(user.id);
      }
    }
  }

  /// Descarga el perfil más nuevo desde internet y actualiza el teléfono.
  Future<void> _downloadAndUpdateUser(String id) async {
    final doc = await _firestore.collection('users').doc(id).get();
    if (!doc.exists) return;
    final d = doc.data()!;
    await _usersDao.upsertUser(
      UsersTableCompanion(
        id: Value(id),
        firebaseUid: Value(d['firebaseUid'] as String?),
        email: Value(d['email'] as String),
        displayName: Value(d['displayName'] as String),
        role: Value(d['role'] as String? ?? 'client'),
        updatedAt: Value((d['updatedAt'] as Timestamp).toDate()),
        syncStatus: const Value('synced'),
        syncVersion: Value((d['syncVersion'] as num).toInt()),
      ),
    );
  }

  // ── 2. MASCOTAS (PETS) ────────────────────────────────────────────────────

  /// Sube los perritos y gatitos registrados sin internet.
  Future<void> _dispatchPets(SyncReport report) async {
    final pending = await _petsDao.getPendingSync();
    for (final pet in pending) {
      final data = _petToMap(pet);
      final result = await _lww.resolve(
        collection: 'pets',
        docId: pet.id,
        localUpdatedAt: pet.updatedAt,
        localSyncVersion: pet.syncVersion,
        localData: data,
      );

      // Si el cambio local gana o es seguro, lo subimos
      if (result != ConflictResult.remoteWins) {
        await _uploadWithBackoff(
          () => _firestore.collection('pets').doc(pet.id).set(data),
        );
        await _petsDao.markSynced(pet.id);
        report.petsSynced++;
      }
    }
  }

  // ── 3. CITAS (APPOINTMENTS) ───────────────────────────────────────────────

  /// Sube las citas agendadas o modificadas localmente.
  Future<void> _dispatchAppointments(SyncReport report) async {
    final pending = await _appointmentsDao.getPendingSync();
    for (final apt in pending) {
      final data = _appointmentToMap(apt);
      final result = await _lww.resolve(
        collection: 'appointments',
        docId: apt.id,
        localUpdatedAt: apt.updatedAt,
        localSyncVersion: apt.syncVersion,
        localData: data,
      );

      if (result != ConflictResult.remoteWins) {
        await _uploadWithBackoff(
          () => _firestore.collection('appointments').doc(apt.id).set(data),
        );
        await _appointmentsDao.markSynced(apt.id);
        report.appointmentsSynced++;
      }
    }
  }

  // ── 4. PRODUCTOS (PRODUCTS) ───────────────────────────────────────────────

  /// Sube las actualizaciones de stock o catálogo de productos.
  Future<void> _dispatchProducts(SyncReport report) async {
    final pending = await _productsDao.getPendingSync();
    for (final product in pending) {
      final data = _productToMap(product);
      final result = await _lww.resolve(
        collection: 'products',
        docId: product.id,
        localUpdatedAt: product.updatedAt,
        localSyncVersion: product.syncVersion,
        localData: data,
      );

      if (result != ConflictResult.remoteWins) {
        await _uploadWithBackoff(
          () => _firestore.collection('products').doc(product.id).set(data),
        );
        await _productsDao.markSynced(product.id);
        report.productsSynced++;
      }
    }
  }

  // ── 5. PEDIDOS (ORDERS) ───────────────────────────────────────────────────

  /// Sube las compras realizadas y sus respectivos renglones/artículos.
  Future<void> _dispatchOrders(SyncReport report) async {
    // A. Subimos primero los encabezados de pedidos principales
    final pendingOrders = await _ordersDao.getPendingSync();
    for (final order in pendingOrders) {
      final data = _orderToMap(order);
      final result = await _lww.resolve(
        collection: 'orders',
        docId: order.id,
        localUpdatedAt: order.updatedAt,
        localSyncVersion: order.syncVersion,
        localData: data,
      );

      if (result != ConflictResult.remoteWins) {
        await _uploadWithBackoff(
          () => _firestore.collection('orders').doc(order.id).set(data),
        );
        await _ordersDao.markSynced(order.id);
        report.ordersSynced++;
      }
    }

    // B. Subimos los renglones (items) de productos a su subcolección en Firestore
    final pendingItems = await _ordersDao.getPendingItemsSync();
    for (final item in pendingItems) {
      await _uploadWithBackoff(
        () => _firestore
            .collection('orders')
            .doc(item.orderId)
            .collection('items')
            .doc(item.id)
            .set(_orderItemToMap(item)),
      );
      await _ordersDao.markSynced(item.id);
      report.orderItemsSynced++;
    }
  }

  // ── 6. HISTORIAL MÉDICO (MEDICAL RECORDS - MERGE ASISTIDO) ────────────────

  /// Sube notas del expediente médico usando la estrategia ultra-segura 'Merge'.
  Future<void> _dispatchMedicalRecords(SyncReport report) async {
    final pending = await _medicalRecordsDao.getPendingSync();
    for (final record in pending) {
      // Evaluamos choque de versiones
      final mergeResult = await _merge.evaluate(
        petId: record.petId,
        recordId: record.id,
        localSyncVersion: record.syncVersion,
        localData: _medicalRecordToMap(record),
      );

      switch (mergeResult) {
        case MergeResult.safe:
          // Caso Seguro: Es una nota médica nueva. La subimos a la subcolección en la nube.
          await _uploadWithBackoff(
            () => _firestore
                .collection('pets')
                .doc(record.petId)
                .collection('medical_records')
                .doc(record.id)
                .set(_medicalRecordToMap(record)),
          );
          await _medicalRecordsDao.markSynced(record.id);
          report.medicalSynced++;
          break;
        case MergeResult.conflict:
          // Caso Conflicto: Alguien modificó la nota en internet y también localmente por separado.
          // Detenemos la subida y la marcamos localmente como 'conflict' para revisión manual.
          await _markMedicalConflict(record.id);
          report.medicalConflicts++;
          break;
        case MergeResult.noChange:
          // Caso Sin Cambios: Ya estaba sincronizado
          await _medicalRecordsDao.markSynced(record.id);
          break;
      }
    }
  }

  /// Rotula una nota médica local como "En Conflicto" para que la app sepa avisarle al usuario.
  Future<void> _markMedicalConflict(
    String id,
  ) => _medicalRecordsDao.resolveConflict(
    id,
    'Conflicto detectado automáticamente en la sincronización. Pendiente de fusión por el veterinario.',
  );

  // ── REINTENTOS CON BACKOFF EXPONENCIAL Y JITTER (MÁXIMA RESILIENCIA) ────────

  /// [_uploadWithBackoff] es un sistema de reintento inteligente.
  ///
  /// Si la red celular del usuario es inestable y falla la subida a internet,
  /// en lugar de rendirse o saturar la batería reintentando como locos,
  /// esta función espera de forma "exponencial":
  /// - Intento 1: Espera 2 segundos.
  /// - Intento 2: Espera 4 segundos.
  /// - Intento 3: Espera 8 segundos.
  /// - Intento 4: Espera 16 segundos.
  /// - Intento 5: Espera 32 segundos.
  ///
  /// Adicionalmente, le agrega un "Jitter" (milisegundos aleatorios entre 0 y 500ms).
  /// Esto evita que si mil teléfonos en la ciudad se quedan sin internet al mismo tiempo en el metro,
  /// todos intenten reconectarse exactamente en el mismo milisegundo al salir, saturando el servidor.
  Future<void> _uploadWithBackoff(
    Future<void> Function() operation, {
    int maxRetries = 5,
  }) async {
    int attempt = 0;
    while (true) {
      try {
        await operation(); // Intentamos ejecutar la subida a internet
        return; // Éxito total, salimos de la función
      } catch (e) {
        attempt++;
        // Si sobrepasamos el límite de reintentos, arrojamos el error para que el motor se entere
        if (attempt >= maxRetries) rethrow;

        // Fórmula: 2^intento segundos de espera
        final baseDelay = pow(2, attempt).toInt();
        // Milisegundos aleatorios para desfasar llamadas
        final jitterMs = Random().nextInt(500);

        // Esperamos pacientemente el tiempo calculado antes de volver a intentar
        await Future.delayed(
          Duration(seconds: baseDelay, milliseconds: jitterMs),
        );
      }
    }
  }

  // ── CONVERSORES DE DATOS (MAPPERS DRIFT -> FIRESTORE) ──────────────────────

  // Las siguientes funciones toman las filas de datos nativos de SQLite (Drift)
  // y las convierten en mapas de datos en formato JSON que Firestore puede leer,
  // encargándose de traducir fechas a Timestamps compatibles con Firebase.

  Map<String, dynamic> _userToMap(UsersTableData u) => {
    'id': u.id,
    'firebaseUid': u.firebaseUid,
    'email': u.email,
    'displayName': u.displayName,
    'role': u.role,
    'isEmailVerified': u.isEmailVerified,
    'phoneNumber': u.phoneNumber,
    'photoUrl': u.photoUrl,
    'createdAt': Timestamp.fromDate(u.createdAt),
    'updatedAt': Timestamp.fromDate(u.updatedAt),
    'deletedAt': u.deletedAt != null ? Timestamp.fromDate(u.deletedAt!) : null,
    'syncVersion': u.syncVersion,
  };

  Map<String, dynamic> _petToMap(PetsTableData p) => {
    'id': p.id,
    'ownerId': p.ownerId,
    'name': p.name,
    'species': p.species,
    'breed': p.breed,
    'gender': p.gender,
    'birthDate': p.birthDate != null ? Timestamp.fromDate(p.birthDate!) : null,
    'weightKg': p.weightKg,
    'colorDesc': p.colorDesc,
    'isNeutered': p.isNeutered,
    'isForSale': p.isForSale,
    'isForAdoption': p.isForAdoption,
    'salePrice': p.salePrice,
    'photoRemoteUrl': p.photoRemoteUrl,
    'notes': p.notes,
    'createdAt': Timestamp.fromDate(p.createdAt),
    'updatedAt': Timestamp.fromDate(p.updatedAt),
    'deletedAt': p.deletedAt != null ? Timestamp.fromDate(p.deletedAt!) : null,
    'syncVersion': p.syncVersion,
  };

  Map<String, dynamic> _appointmentToMap(AppointmentsTableData a) => {
    'id': a.id,
    'petId': a.petId,
    'clientId': a.clientId,
    'staffId': a.staffId,
    'serviceType': a.serviceType,
    'status': a.status,
    'scheduledAt': Timestamp.fromDate(a.scheduledAt),
    'durationMinutes': a.durationMinutes,
    'price': a.price,
    'notes': a.notes,
    'reminderSent': a.reminderSent,
    'whatsappSent': a.whatsappSent,
    'createdAt': Timestamp.fromDate(a.createdAt),
    'updatedAt': Timestamp.fromDate(a.updatedAt),
    'deletedAt': a.deletedAt != null ? Timestamp.fromDate(a.deletedAt!) : null,
    'syncVersion': a.syncVersion,
  };

  Map<String, dynamic> _productToMap(ProductsTableData p) => {
    'id': p.id,
    'name': p.name,
    'description': p.description,
    'category': p.category,
    'brand': p.brand,
    'sku': p.sku,
    'price': p.price,
    'discountPct': p.discountPct,
    'stockQty': p.stockQty,
    'stockMinAlert': p.stockMinAlert,
    'isActive': p.isActive,
    'imageRemoteUrl': p.imageRemoteUrl,
    'targetSpecies': p.targetSpecies,
    'createdAt': Timestamp.fromDate(p.createdAt),
    'updatedAt': Timestamp.fromDate(p.updatedAt),
    'deletedAt': p.deletedAt != null ? Timestamp.fromDate(p.deletedAt!) : null,
    'syncVersion': p.syncVersion,
  };

  Map<String, dynamic> _orderToMap(OrdersTableData o) => {
    'id': o.id,
    'clientId': o.clientId,
    'driverId': o.driverId,
    'status': o.status,
    'subtotal': o.subtotal,
    'deliveryFee': o.deliveryFee,
    'totalAmount': o.totalAmount,
    'deliveryAddress': o.deliveryAddress,
    'deliveryLat': o.deliveryLat,
    'deliveryLng': o.deliveryLng,
    'paymentMethod': o.paymentMethod,
    'paymentStatus': o.paymentStatus,
    'clientNotes': o.clientNotes,
    'placedAt': o.placedAt != null ? Timestamp.fromDate(o.placedAt!) : null,
    'deliveredAt': o.deliveredAt != null
        ? Timestamp.fromDate(o.deliveredAt!)
        : null,
    'createdAt': Timestamp.fromDate(o.createdAt),
    'updatedAt': Timestamp.fromDate(o.updatedAt),
    'deletedAt': o.deletedAt != null ? Timestamp.fromDate(o.deletedAt!) : null,
    'syncVersion': o.syncVersion,
  };

  Map<String, dynamic> _orderItemToMap(OrderItemsTableData i) => {
    'id': i.id,
    'orderId': i.orderId,
    'productId': i.productId,
    'quantity': i.quantity,
    'unitPrice': i.unitPrice,
    'subtotal': i.subtotal,
    'productSnapshot': i.productSnapshot,
    'createdAt': Timestamp.fromDate(i.createdAt),
    'updatedAt': Timestamp.fromDate(i.updatedAt),
    'syncVersion': i.syncVersion,
  };

  Map<String, dynamic> _medicalRecordToMap(MedicalRecordsTableData r) => {
    'id': r.id,
    'petId': r.petId,
    'vetId': r.vetId,
    'recordType': r.recordType,
    'title': r.title,
    'description': r.description,
    'weightKg': r.weightKg,
    'medicationName': r.medicationName,
    'dosage': r.dosage,
    'nextDueDate': r.nextDueDate != null
        ? Timestamp.fromDate(r.nextDueDate!)
        : null,
    'attachmentRemoteUrl': r.attachmentRemoteUrl,
    'conflictNotes': r.conflictNotes,
    'createdAt': Timestamp.fromDate(r.createdAt),
    'updatedAt': Timestamp.fromDate(r.updatedAt),
    'deletedAt': r.deletedAt != null ? Timestamp.fromDate(r.deletedAt!) : null,
    'syncVersion': r.syncVersion,
  };
}

// EL REPORTE DE RESULTADOS (SYNC REPORT)
// Esta clase recopila las estadísticas de la sincronización activa.
// Nos dice exactamente qué tablas se subieron y si se detectó algún conflicto médico.

class SyncReport {
  int usersSynced = 0;
  int petsSynced = 0;
  int appointmentsSynced = 0;
  int productsSynced = 0;
  int ordersSynced = 0;
  int orderItemsSynced = 0;
  int medicalSynced = 0;
  int medicalConflicts = 0;
  bool tracksSynced = false;

  /// Retorna verdadero si hay notas médicas que chocaron y requieren revisión del administrador.
  bool get hasConflicts => medicalConflicts > 0;

  /// Suma total de todos los registros que se subieron exitosamente a internet.
  int get totalSynced =>
      usersSynced +
      petsSynced +
      appointmentsSynced +
      productsSynced +
      ordersSynced +
      orderItemsSynced +
      medicalSynced;

  @override
  String toString() =>
      'SyncReport(total: $totalSynced, conflicts: $medicalConflicts, gps: $tracksSynced)';
}
