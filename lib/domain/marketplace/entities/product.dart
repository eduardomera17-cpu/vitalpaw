// lib/domain/marketplace/entities/product.dart

class Product {
  final String id;
  final String name;
  final String? description;
  final ProductCategory category;
  final String? brand;
  final String? sku;
  final double price;
  final double discountPct; // 0.0 – 100.0
  final int stockQty;
  final int stockMinAlert;
  final bool isActive;
  final String? imageLocalPath;
  final String? imageRemoteUrl;
  final List<String> targetSpecies; // ['dog','cat','bird']
  final DateTime createdAt;
  final DateTime updatedAt;

  const Product({
    required this.id,
    required this.name,
    this.description,
    required this.category,
    this.brand,
    this.sku,
    required this.price,
    this.discountPct = 0.0,
    required this.stockQty,
    this.stockMinAlert = 5,
    this.isActive = true,
    this.imageLocalPath,
    this.imageRemoteUrl,
    this.targetSpecies = const [],
    required this.createdAt,
    required this.updatedAt,
  });

  /// Precio final después de descuento
  double get finalPrice => price * (1 - discountPct / 100);

  bool get hasDiscount => discountPct > 0;

  bool get isLowStock => stockQty > 0 && stockQty <= stockMinAlert;

  bool get isOutOfStock => stockQty <= 0;

  StockStatus get stockStatus {
    if (isOutOfStock) return StockStatus.outOfStock;
    if (isLowStock) return StockStatus.lowStock;
    return StockStatus.available;
  }

  /// Devuelve la URL de imagen disponible (prioriza remota)
  String? get imageUrl => imageRemoteUrl ?? imageLocalPath;

  /// Genera un snapshot JSON congelado del producto para el pedido
  Map<String, dynamic> toSnapshot() => {
    'name': name,
    'brand': brand,
    'category': category.name,
    'imageUrl': imageUrl,
    'price': price,
    'discountPct': discountPct,
    'finalPrice': finalPrice,
  };

  /// Verifica si hay stock suficiente para una cantidad solicitada
  bool hasStockFor(int quantity) => stockQty >= quantity;
}

enum ProductCategory {
  food,
  accessory,
  medicine,
  toy,
  hygiene;

  String get displayName => switch (this) {
    food => 'Alimentos',
    accessory => 'Accesorios',
    medicine => 'Medicamentos',
    toy => 'Juguetes',
    hygiene => 'Higiene',
  };

  String get icon => switch (this) {
    food => '🥩',
    accessory => '🦮',
    medicine => '💊',
    toy => '🎾',
    hygiene => '🧴',
  };

  static ProductCategory fromString(String value) {
    return ProductCategory.values.firstWhere(
      (c) => c.name == value,
      orElse: () => ProductCategory.accessory,
    );
  }
}

enum StockStatus {
  available,
  lowStock,
  outOfStock;

  String get label => switch (this) {
    available => 'Disponible',
    lowStock => 'Últimas unidades',
    outOfStock => 'Agotado',
  };
}
