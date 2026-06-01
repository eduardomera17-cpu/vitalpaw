import 'package:drift/drift.dart';
import '../database/app_database.dart';
import '../tables/pets_table.dart';

part 'pets_dao.g.dart';

// CAJERO ESPECÍFICO DE MASCOTAS (PETS DAO)
// Esta clase contiene las funciones que nos permiten buscar, registrar, editar
// y eliminar mascotas en la base de datos interna del teléfono de forma organizada.

@DriftAccessor(tables: [PetsTable])
class PetsDao extends DatabaseAccessor<AppDatabase> with _$PetsDaoMixin {
  PetsDao(super.db);

  /// Agrega o edita una mascota en la base de datos local (Operación Upsert).
  Future<void> upsertPet(PetsTableCompanion pet) =>
      into(db.petsTable).insertOnConflictUpdate(pet);

  /// Obtiene un canal reactivo (Stream) con la lista de mascotas de un dueño específico.
  ///
  /// Las mascotas que ya fueron eliminadas lógicamente son excluidas.
  /// El listado se ordena alfabéticamente por el nombre de la mascota.
  Stream<List<PetsTableData>> watchPetsByOwner(String ownerId) =>
      (select(db.petsTable)
            ..where((t) => t.ownerId.equals(ownerId) & t.deletedAt.isNull())
            ..orderBy([(t) => OrderingTerm.asc(t.name)]))
          .watch();

  /// Obtiene un canal reactivo (Stream) con la lista de mascotas listas para adopción o venta.
  ///
  /// Filtra aquellas mascotas donde 'isForSale' o 'isForAdoption' sean verdaderos,
  /// excluyendo las que estén eliminadas.
  Stream<List<PetsTableData>> watchForSaleOrAdoption() =>
      (select(db.petsTable)..where(
            (t) =>
                (t.isForSale.equals(true) | t.isForAdoption.equals(true)) &
                t.deletedAt.isNull(),
          ))
          .watch();

  /// Obtiene las mascotas que se crearon o modificaron sin internet y están pendientes de subirse al servidor.
  Future<List<PetsTableData>> getPendingSync() => (select(
    db.petsTable,
  )..where((t) => t.syncStatus.equals('pending'))).get();

  /// Cambia el estado de una mascota a 'synced' una vez que se subió con éxito a la nube.
  Future<void> markSynced(String id) =>
      (update(db.petsTable)..where((t) => t.id.equals(id))).write(
        PetsTableCompanion(
          syncStatus: const Value('synced'),
          updatedAt: Value(DateTime.now()),
        ),
      );

  /// Elimina una mascota de forma lógica (Soft Delete).
  ///
  /// Registra la fecha actual de borrado en 'deletedAt' y la marca en 'pending'
  /// para que la sincronización en la nube sepa que debe eliminarla de internet también.
  Future<void> softDelete(String id) =>
      (update(db.petsTable)..where((t) => t.id.equals(id))).write(
        PetsTableCompanion(
          deletedAt: Value(DateTime.now()),
          updatedAt: Value(DateTime.now()),
          syncStatus: const Value('pending'),
        ),
      );
}
