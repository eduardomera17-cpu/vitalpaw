// ignore_for_file: prefer_initializing_formals

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drift/drift.dart'; // Importante para la clase 'Value' de Drift
import '../local/database/app_database.dart';
import '../local/daos/appointments_dao.dart';
import '../local/daos/products_dao.dart';

// ESCUCHADOR DE CAMBIOS EN VIVO (REMOTE LISTENER)
// Este componente hace el trabajo inverso del despachador: escucha a la nube.
// Se suscribe a internet (Google Firestore) en tiempo real para enterarse de forma instantánea
// si otra persona (como el administrador desde su computadora en la veterinaria) hace algún cambio
// en una cita o si se actualizan precios/stock de productos.
//
// Al detectar un cambio en la nube, lo descarga y lo guarda de inmediato en la base de datos SQLite
// local del celular para mantener toda la interfaz de la app viva y actualizada en el segundo.

class RemoteListener {
  // Conector a la nube de Firestore
  final FirebaseFirestore _firestore;

  // Cajeros de base de datos para guardar los cambios recibidos de internet
  final AppointmentsDao _appointmentsDao;
  final ProductsDao _productsDao;

  // Lista para rastrear todas las conexiones activas en tiempo real (Streams)
  final List<StreamSubscription> _subscriptions = [];

  RemoteListener({
    required FirebaseFirestore firestore,
    required AppointmentsDao appointmentsDao,
    required ProductsDao productsDao,
  }) : _firestore = firestore,
       _appointmentsDao = appointmentsDao,
       _productsDao = productsDao;

  /// Se conecta a Firestore y empieza a escuchar en tiempo real las citas de este cliente.
  ///
  /// Si el administrador confirma, cancela o reagenda una cita en la oficina,
  /// este escuchador captura el evento e impacta el cambio localmente.
  void listenClientAppointments(String clientId) {
    final sub = _firestore
        .collection('appointments')
        .where('clientId', isEqualTo: clientId)
        .where('deletedAt', isNull: true) // Omitimos citas eliminadas
        .snapshots()
        .listen((snapshot) {
          // Recorremos los cambios detectados en el paquete (snapshot)
          for (final change in snapshot.docChanges) {
            // Si el documento en internet se modificó o se añadió nuevo:
            if (change.type == DocumentChangeType.modified ||
                change.type == DocumentChangeType.added) {
              _applyRemoteAppointment(change.doc.data()!);
            }
          }
        });

    // Guardamos la suscripción para poder cancelarla después
    _subscriptions.add(sub);
  }

  /// Se conecta a Firestore para escuchar en vivo cambios en el catálogo e inventario.
  ///
  /// Si se modifica el precio de un juguete o baja el stockQty de croquetas, la app se actualiza sola.
  void listenProducts() {
    final sub = _firestore
        .collection('products')
        .where('isActive', isEqualTo: true)
        .snapshots()
        .listen((snapshot) {
          for (final change in snapshot.docChanges) {
            // Mientras el producto no haya sido eliminado físicamente en internet:
            if (change.type != DocumentChangeType.removed) {
              _applyRemoteProduct(change.doc.data()!);
            }
          }
        });
    _subscriptions.add(sub);
  }

  /// Guarda una actualización de cita recibida de internet en la base de datos del teléfono.
  Future<void> _applyRemoteAppointment(Map<String, dynamic> data) async {
    await _appointmentsDao.upsertAppointment(
      AppointmentsTableCompanion(
        id: Value(data['id'] as String),
        petId: Value(data['petId'] as String),
        clientId: Value(data['clientId'] as String),
        staffId: Value(data['staffId'] as String?),
        serviceType: Value(data['serviceType'] as String),
        status: Value(data['status'] as String),
        // Convertimos el Timestamp de Firestore a fecha nativa de Dart
        scheduledAt: Value((data['scheduledAt'] as Timestamp).toDate()),
        durationMinutes: Value((data['durationMinutes'] as num).toInt()),
        price: Value((data['price'] as num?)?.toDouble()),
        notes: Value(data['notes'] as String?),
        updatedAt: Value((data['updatedAt'] as Timestamp).toDate()),
        // Rotulamos como 'synced' porque este dato viene directamente de internet y está al día
        syncStatus: const Value('synced'),
        syncVersion: Value((data['syncVersion'] as num).toInt()),
      ),
    );
  }

  /// Guarda una actualización de producto recibida de internet en la base de datos del teléfono.
  Future<void> _applyRemoteProduct(Map<String, dynamic> data) async {
    await _productsDao.upsertProduct(
      ProductsTableCompanion(
        id: Value(data['id'] as String),
        name: Value(data['name'] as String),
        category: Value(data['category'] as String),
        price: Value((data['price'] as num).toDouble()),
        stockQty: Value((data['stockQty'] as num).toInt()),
        updatedAt: Value((data['updatedAt'] as Timestamp).toDate()),
        syncStatus: const Value('synced'),
        syncVersion: Value((data['syncVersion'] as num).toInt()),
      ),
    );
  }

  /// Cierra todas las conexiones activas en tiempo real al apagar la app
  /// para no consumir batería ni datos del teléfono innecesariamente.
  void dispose() {
    for (final sub in _subscriptions) {
      sub.cancel(); // Apagamos cada antena de escucha
    }
    _subscriptions.clear();
  }
}
