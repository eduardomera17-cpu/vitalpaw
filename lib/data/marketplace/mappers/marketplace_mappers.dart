// lib/data/marketplace/mappers/marketplace_mappers.dart

import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart' hide Order;
import 'package:drift/drift.dart';

import '../../../domain/marketplace/entities/order.dart';
import '../../../domain/marketplace/entities/cart_item.dart';
import '../../local/database/app_database.dart';

class MarketplaceMappers {
  // ─── Product ───

  static ProductsTableCompanion productFromFirestore(
    String id,
    Map<String, dynamic> data,
  ) {
    return ProductsTableCompanion(
      id: Value(id),
      name: Value(data['name'] as String),
      description: Value(data['description'] as String?),
      category: Value(data['category'] as String),
      brand: Value(data['brand'] as String?),
      sku: Value(data['sku'] as String?),
      price: Value((data['price'] as num).toDouble()),
      discountPct: Value((data['discountPct'] as num?)?.toDouble() ?? 0.0),
      stockQty: Value(data['stockQty'] as int? ?? 0),
      stockMinAlert: Value(data['stockMinAlert'] as int? ?? 5),
      isActive: Value(data['isActive'] as bool? ?? true),
      imageRemoteUrl: Value(data['imageRemoteUrl'] as String?),
      targetSpecies: Value(
        data['targetSpecies'] != null
            ? jsonEncode(data['targetSpecies'])
            : null,
      ),
      createdAt: Value((data['createdAt'] as Timestamp).toDate()),
      updatedAt: Value((data['updatedAt'] as Timestamp).toDate()),
      deletedAt: Value(
        data['deletedAt'] != null
            ? (data['deletedAt'] as Timestamp).toDate()
            : null,
      ),
      syncStatus: const Value('synced'),
      syncVersion: Value(data['syncVersion'] as int? ?? 0),
    );
  }

  static Map<String, dynamic> productToFirestore(ProductsTableData p) {
    return {
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
      'targetSpecies': p.targetSpecies != null
          ? jsonDecode(p.targetSpecies!)
          : null,
      'createdAt': Timestamp.fromDate(p.createdAt),
      'updatedAt': Timestamp.fromDate(p.updatedAt),
      'deletedAt': p.deletedAt != null
          ? Timestamp.fromDate(p.deletedAt!)
          : null,
      'syncVersion': p.syncVersion,
    };
  }

  // ─── Order (shared mapper to avoid duplication) ───

  static Order orderFromData(OrdersTableData row, List<CartItem> items) {
    return Order(
      id: row.id,
      clientId: row.clientId,
      driverId: row.driverId,
      status: OrderStatus.fromString(row.status),
      items: items,
      subtotal: row.subtotal,
      deliveryFee: row.deliveryFee,
      totalAmount: row.totalAmount,
      deliveryAddress: row.deliveryAddress,
      deliveryLat: row.deliveryLat,
      deliveryLng: row.deliveryLng,
      paymentMethod: row.paymentMethod != null
          ? PaymentMethod.fromString(row.paymentMethod!)
          : null,
      paymentStatus: PaymentStatus.fromString(row.paymentStatus),
      clientNotes: row.clientNotes,
      placedAt: row.placedAt,
      deliveredAt: row.deliveredAt,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }
}
