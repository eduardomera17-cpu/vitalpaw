import 'package:drift/drift.dart';
import '../database/app_database.dart';
import '../tables/products_table.dart';

part 'products_dao.g.dart';

@DriftAccessor(tables: [ProductsTable])
class ProductsDao extends DatabaseAccessor<AppDatabase>
    with _$ProductsDaoMixin {
  ProductsDao(super.db);

  /// Stream de productos activos, opcionalmente filtrados por categoría.
  Stream<List<ProductsTableData>> watchActiveCatalog({String? category}) {
    final query = select(productsTable)
      ..where((p) => p.isActive.equals(true))
      ..where((p) => p.deletedAt.isNull())
      ..orderBy([(p) => OrderingTerm.asc(p.name)]);

    if (category != null) {
      query.where((p) => p.category.equals(category));
    }
    return query.watch();
  }

  /// Paginación: obtener página de productos.
  Future<List<ProductsTableData>> getCatalogPage({
    String? category,
    required int limit,
    required int offset,
  }) {
    final query = select(productsTable)
      ..where((p) => p.isActive.equals(true))
      ..where((p) => p.deletedAt.isNull())
      ..orderBy([(p) => OrderingTerm.asc(p.name)])
      ..limit(limit, offset: offset);

    if (category != null) {
      query.where((p) => p.category.equals(category));
    }
    return query.get();
  }

  /// Búsqueda por nombre, marca o SKU (case-insensitive).
  Future<List<ProductsTableData>> searchProducts(String query) {
    final pattern = '%${query.toLowerCase()}%';
    return (select(productsTable)
          ..where(
            (p) =>
                p.name.lower().like(pattern) |
                p.brand.lower().like(pattern) |
                p.sku.lower().like(pattern),
          )
          ..where((p) => p.isActive.equals(true))
          ..where((p) => p.deletedAt.isNull()))
        .get();
  }

  /// Obtener producto por ID (sin filtro de deleted para poder hacer restore).
  Future<ProductsTableData?> getById(String id) {
    return (select(productsTable)
          ..where((p) => p.id.equals(id))
          ..where((p) => p.deletedAt.isNull()))
        .getSingleOrNull();
  }

  /// Productos con stock bajo (stockQty > 0 AND stockQty <= stockMinAlert).
  Stream<List<ProductsTableData>> watchLowStock() {
    return (select(productsTable)
          ..where((p) => p.isActive.equals(true))
          ..where((p) => p.deletedAt.isNull())
          ..where((p) => p.stockQty.isSmallerOrEqualValue(5))
          ..where((p) => p.stockQty.isBiggerThanValue(0)))
        .watch();
  }

  /// Decrementar stock atómicamente. Retorna false si stock insuficiente.
  Future<bool> decrementStock(String productId, int qty) async {
    final product = await getById(productId);
    if (product == null || product.stockQty < qty) return false;

    await (update(productsTable)..where((p) => p.id.equals(productId))).write(
      ProductsTableCompanion(
        stockQty: Value(product.stockQty - qty),
        updatedAt: Value(DateTime.now()),
        syncStatus: const Value('pending'),
        syncVersion: Value(product.syncVersion + 1),
      ),
    );
    return true;
  }

  /// Restaurar stock (al cancelar un pedido).
  Future<void> restoreStock(String productId, int qty) async {
    final product = await getById(productId);
    if (product == null) return;

    await (update(productsTable)..where((p) => p.id.equals(productId))).write(
      ProductsTableCompanion(
        stockQty: Value(product.stockQty + qty),
        updatedAt: Value(DateTime.now()),
        syncStatus: const Value('pending'),
        syncVersion: Value(product.syncVersion + 1),
      ),
    );
  }

  /// Upsert para sincronización desde Firestore.
  Future<void> upsertProduct(ProductsTableCompanion product) {
    return into(productsTable).insertOnConflictUpdate(product);
  }

  /// Obtener todos los registros pendientes de sincronización.
  Future<List<ProductsTableData>> getPendingSyncProducts() {
    return (select(productsTable)
          ..where((p) => p.syncStatus.equals('pending')))
        .get();
  }

  /// Alias usado por SyncDispatcher
  Future<List<ProductsTableData>> getPendingSync() => getPendingSyncProducts();

  /// Marcar como sincronizado
  Future<void> markSynced(String id) {
    return (update(productsTable)..where((p) => p.id.equals(id)))
        .write(const ProductsTableCompanion(syncStatus: Value('synced')));
  }
}
