// lib/data/marketplace/product_repository_impl.dart

import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drift/drift.dart';

import '../../domain/marketplace/entities/marketplace_exception.dart';
import '../../domain/marketplace/entities/product.dart';
import '../../domain/marketplace/repositories/product_repository.dart';
import '../local/daos/products_dao.dart';
import '../local/database/app_database.dart';
import 'mappers/marketplace_mappers.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductsDao _productsDao;
  final FirebaseFirestore _firestore;

  ProductRepositoryImpl(this._productsDao, this._firestore);

  @override
  Stream<List<Product>> watchCatalog({ProductCategory? category}) {
    return _productsDao
        .watchActiveCatalog(category: category?.name)
        .map((rows) => rows.map(_toEntity).toList());
  }

  @override
  Future<List<Product>> getCatalogPage({
    ProductCategory? category,
    required int limit,
    required int offset,
  }) async {
    final rows = await _productsDao.getCatalogPage(
      category: category?.name,
      limit: limit,
      offset: offset,
    );
    return rows.map(_toEntity).toList();
  }

  @override
  Future<List<Product>> search(String query) async {
    if (query.trim().isEmpty) return [];
    final rows = await _productsDao.searchProducts(query);
    return rows.map(_toEntity).toList();
  }

  @override
  Future<Product?> getById(String productId) async {
    final row = await _productsDao.getById(productId);
    return row != null ? _toEntity(row) : null;
  }

  @override
  Stream<List<Product>> watchLowStock() {
    return _productsDao.watchLowStock().map(
      (rows) => rows.map(_toEntity).toList(),
    );
  }

  @override
  Future<void> decrementStock(String productId, int qty) async {
    final success = await _productsDao.decrementStock(productId, qty);
    if (!success) {
      final product = await _productsDao.getById(productId);
      throw InsufficientStockException(
        productId: productId,
        productName: product?.name ?? 'Desconocido',
        available: product?.stockQty ?? 0,
        requested: qty,
      );
    }
  }

  @override
  Future<void> restoreStock(String productId, int qty) async {
    await _productsDao.restoreStock(productId, qty);
  }

  @override
  Future<void> syncFromRemote() async {
    try {
      final snapshot = await _firestore.collection('products').get();

      for (final doc in snapshot.docs) {
        final remoteData = doc.data();
        final remoteUpdatedAt = (remoteData['updatedAt'] as Timestamp).toDate();

        // LWW: Comparar updatedAt remoto vs local
        final localProduct = await _productsDao.getById(doc.id);

        if (localProduct == null ||
            remoteUpdatedAt.isAfter(localProduct.updatedAt)) {
          // El remoto es más reciente → actualizar local
          await _productsDao.upsertProduct(
            MarketplaceMappers.productFromFirestore(doc.id, remoteData),
          );
        }
        // Si el local es más reciente, se sincronizará en syncToRemote
      }
    } catch (_) {
      // Sin conexión: ignorar silenciosamente, los datos locales son válidos
    }
  }

  @override
  Future<void> syncToRemote() async {
    final pending = await _productsDao.getPendingSyncProducts();

    for (final product in pending) {
      try {
        final remoteDoc = await _firestore
            .collection('products')
            .doc(product.id)
            .get();

        if (remoteDoc.exists) {
          final remoteUpdatedAt = (remoteDoc.data()!['updatedAt'] as Timestamp)
              .toDate();

          // LWW: Solo escribir si el local es más reciente
          if (product.updatedAt.isAfter(remoteUpdatedAt)) {
            await _firestore
                .collection('products')
                .doc(product.id)
                .set(MarketplaceMappers.productToFirestore(product));
          }
        } else {
          // Producto nuevo: crear en Firestore
          await _firestore
              .collection('products')
              .doc(product.id)
              .set(MarketplaceMappers.productToFirestore(product));
        }

        // Marcar como sincronizado en Drift
        await _productsDao.upsertProduct(
          ProductsTableCompanion(
            id: Value(product.id),
            syncStatus: const Value('synced'),
          ),
        );
      } catch (_) {
        // Sin conexión: seguirá pendiente para el próximo sync
      }
    }
  }

  Product _toEntity(ProductsTableData row) => Product(
    id: row.id,
    name: row.name,
    description: row.description,
    category: ProductCategory.fromString(row.category),
    brand: row.brand,
    sku: row.sku,
    price: row.price,
    discountPct: row.discountPct,
    stockQty: row.stockQty,
    stockMinAlert: row.stockMinAlert,
    isActive: row.isActive,
    imageLocalPath: row.imageLocalPath,
    imageRemoteUrl: row.imageRemoteUrl,
    targetSpecies: row.targetSpecies != null
        ? List<String>.from(jsonDecode(row.targetSpecies!))
        : [],
    createdAt: row.createdAt,
    updatedAt: row.updatedAt,
  );
}
