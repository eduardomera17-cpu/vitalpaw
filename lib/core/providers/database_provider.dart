import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/local/database/app_database.dart';

// UN ALMACÉN CENTRAL DE LA BASE DE DATOS LOCAL
// Aquí creamos los "accesos directos" (Providers) para que cualquier parte de la aplicación
// pueda guardar o leer información en el teléfono de forma sencilla y organizada.

/// [appDatabaseProvider] crea y administra una ÚNICA instancia de nuestra base de datos local SQLite.
/// Usamos un "Provider" de Riverpod para asegurarnos de que toda la aplicación comparta la misma base de datos
/// y no creemos múltiples copias que puedan chocar entre sí (Patrón Singleton).
final appDatabaseProvider = Provider<AppDatabase>((ref) {
  // Creamos la conexión a la base de datos.
  final db = AppDatabase();

  // 'onDispose' es un guardián de limpieza. Si la aplicación se apaga o ya no necesita
  // la base de datos, este código se asegura de cerrar la conexión correctamente
  // para evitar que se dañe o corrompa la información guardada.
  ref.onDispose(db.close);

  // Devolvemos la base de datos lista para ser usada.
  return db;
});

// PROVÉEDORES DE ACCESO INDIVIDUALES (DAOs)
// En lugar de exponer toda la base de datos a todas partes, creamos accesos directos
// específicos (DAOs) para cada tipo de información. Es como tener diferentes cajeros
// en un banco: uno atiende mascotas, otro usuarios, otro citas, etc.

/// Cajero especializado en la tabla de Usuarios. Permite buscar, registrar y actualizar perfiles.
final usersDaoProvider = Provider(
  (ref) => ref.watch(appDatabaseProvider).usersDao,
);

/// Cajero especializado en Mascotas. Permite ver la lista de perritos/gatitos y agregar nuevos.
final petsDaoProvider = Provider(
  (ref) => ref.watch(appDatabaseProvider).petsDao,
);

/// Cajero especializado en las Citas médicas o de estética de las mascotas.
final appointmentsDaoProvider = Provider(
  (ref) => ref.watch(appDatabaseProvider).appointmentsDao,
);

/// Cajero especializado en el Historial Médico de cada mascota.
final medicalRecordsDaoProvider = Provider(
  (ref) => ref.watch(appDatabaseProvider).medicalRecordsDao,
);

/// Cajero especializado en el catálogo de Productos de la tienda (comida, juguetes, etc.).
final productsDaoProvider = Provider(
  (ref) => ref.watch(appDatabaseProvider).productsDao,
);

/// Cajero especializado en las Compras y Pedidos realizados por los clientes.
final ordersDaoProvider = Provider(
  (ref) => ref.watch(appDatabaseProvider).ordersDao,
);

/// Cajero especializado en el Rastreo GPS en tiempo real para repartidores de pedidos.
final locationTracksDaoProvider = Provider(
  (ref) => ref.watch(appDatabaseProvider).locationTracksDao,
);
