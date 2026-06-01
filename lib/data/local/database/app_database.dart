import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';

import 'connection.dart'
    if (dart.library.js_util) 'connection_web.dart'
    if (dart.library.ffi) 'connection_native.dart' as impl;

import '../tables/users_table.dart';
import '../tables/pets_table.dart';
import '../tables/appointments_table.dart';
import '../tables/medical_records_table.dart';
import '../tables/products_table.dart';
import '../tables/orders_table.dart';
import '../tables/order_items_table.dart';
import '../tables/location_tracks_table.dart';
import '../daos/users_dao.dart';
import '../daos/pets_dao.dart';
import '../daos/appointments_dao.dart';
import '../daos/medical_records_dao.dart';
import '../daos/products_dao.dart';
import '../daos/orders_dao.dart';
import '../daos/location_tracks_dao.dart';
import '../tables/adoption_requests_table.dart';
import '../daos/adoption_requests_dao.dart';
import '../tables/chat_tables.dart';
import '../daos/chat_dao.dart';

// Este archivo es una plantilla. Drift usará esta directiva para autogenerar
// el archivo 'app_database.g.dart' con todo el código SQL pesado. NUNCA edites el archivo '.g.dart'.
part 'app_database.g.dart';

// LA CENTRAL DE LA BASE DE DATOS LOCAL (APP DATABASE)
// Esta clase agrupa todas nuestras tablas y DAOs (cajeros de datos) y se encarga de crear,
// actualizar y conectar la base de datos interna SQLite del teléfono celular.

@DriftDatabase(
  // Listado de todas las tablas que existirán en nuestra base de datos.
  tables: [
    UsersTable,
    PetsTable,
    AppointmentsTable,
    MedicalRecordsTable,
    ProductsTable,
    OrdersTable,
    OrderItemsTable,
    LocationTracksTable,
    AdoptionRequestsTable,
    ChatRoomsTable,
    ChatMessagesTable,
  ],
  // Listado de todos los DAOs (cajeros de datos especializados) para interactuar con las tablas.
  daos: [
    UsersDao,
    PetsDao,
    AppointmentsDao,
    MedicalRecordsDao,
    ProductsDao,
    OrdersDao,
    LocationTracksDao,
    AdoptionRequestsDao,
    ChatDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  // El constructor de producción abre la base de datos de forma multiplataforma.
  AppDatabase() : super(impl.openConnection());

  // Este constructor especial sirve únicamente para hacer pruebas automáticas (tests) en memoria,
  // evitando crear archivos de prueba pesados en el teléfono o computadora.
  AppDatabase.forTesting(super.executor);

  /// Versión de la estructura de la base de datos (Esquema).
  /// Si mañana agregamos una nueva columna a una tabla, debemos subir este número a 2
  /// e implementar la migración en [onUpgrade] para que la app no falle al actualizarse.
  @override
  int get schemaVersion => 3;

  /// La estrategia de migración define qué hacer cuando la base de datos se crea por primera vez
  /// o cuando se actualiza la app del usuario.
  @override
  MigrationStrategy get migration => MigrationStrategy(
    // Qué hacer cuando el usuario instala la app por primera vez:
    // Crea todas las tablas vacías automáticamente.
    onCreate: (m) async {
      await m.createAll();
    },
    // Qué hacer si el usuario ya tenía la app vieja instalada y la actualizó:
    onUpgrade: (m, from, to) async {
      if (from < 2) {
        await m.createTable(chatRoomsTable);
        await m.createTable(chatMessagesTable);
      }
      if (from < 3) {
        await m.addColumn(usersTable, usersTable.isActive);
      }
    },
    beforeOpen: (details) async {
      // 1. Activamos la Integridad Referencial ('PRAGMA foreign_keys = ON').
      // Por defecto, SQLite la tiene apagada. Esto asegura que si intentamos guardar una mascota
      // con un 'ownerId' que no existe, la base de datos lance un error para evitar que queden datos "huérfanos".
      // Nota: En Web (IndexedDB) estos comandos pueden arrojar errores, así que los omitimos.
      if (!kIsWeb) {
        await customStatement('PRAGMA foreign_keys = ON');

        // 2. Activamos el modo WAL ('PRAGMA journal_mode = WAL').
        // Esto hace que SQLite escriba de forma mucho más rápida y permita lecturas y escrituras concurrentes
        // sin bloquear o congelar la pantalla de la app.
        await customStatement('PRAGMA journal_mode = WAL');
      }
    },
  );
}


