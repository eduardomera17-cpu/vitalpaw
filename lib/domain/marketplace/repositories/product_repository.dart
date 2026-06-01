// lib/domain/marketplace/repositories/product_repository.dart

import '../entities/product.dart';

abstract class ProductRepository {
  /// Stream reactivo del catálogo activo, filtrado por categoría.
  /// Solo devuelve productos con isActive=true y deletedAt=null.
  Stream<List<Product>> watchCatalog({ProductCategory? category});

  /// Catálogo paginado para rendimiento en catálogos grandes.
  Future<List<Product>> getCatalogPage({
    ProductCategory? category,
    required int limit,
    required int offset,
  });

  /// Búsqueda por nombre, marca o SKU (case-insensitive).
  Future<List<Product>> search(String query);

  /// Obtener un producto por ID. Retorna null si no existe o fue eliminado.
  Future<Product?> getById(String productId);

  /// Productos con stock bajo — para alertas en panel admin.
  Stream<List<Product>> watchLowStock();

  /// Decrementar stock al confirmar pedido.
  /// Lanza [InsufficientStockException] si no hay stock suficiente.
  Future<void> decrementStock(String productId, int qty);

  /// Restaurar stock al cancelar pedido.
  Future<void> restoreStock(String productId, int qty);

  /// Sincronizar catálogo desde Firestore al abrir la app.
  /// Usa LWW: compara updatedAt local vs remoto.
  Future<void> syncFromRemote();

  /// Sincronizar cambios locales pendientes a Firestore.
  Future<void> syncToRemote();
}
