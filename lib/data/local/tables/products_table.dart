import 'package:drift/drift.dart';

// DEFINICIÓN DE LA TABLA DE PRODUCTOS (TABLA DRIFT)
// Esta clase le dice a SQLite cómo estructurar el catálogo de la tienda Pet Shop.
// Aquí guardamos los datos de croquetas, juguetes, collares y medicamentos que vendemos.

class ProductsTable extends Table {
  @override
  String get tableName => 'products';

  // COLUMNAS DE LA TABLA

  /// Identificador único del producto (UUID largo).
  TextColumn get id => text()();

  /// Nombre del producto (ej. "Comida para Cachorro Sabor Pollo").
  TextColumn get name => text()();

  /// Explicación sobre para qué sirve el producto, ingredientes, etc. (opcional).
  TextColumn get description => text().nullable()();

  /// Categoría del producto.
  /// Valores: 'food' (comida), 'accessory' (accesorio), 'medicine' (medicamento),
  /// 'toy' (juguete), 'hygiene' (limpieza/higiene).
  TextColumn get category => text()();

  /// Marca fabricante del producto (ej. "Royal Canin", "Kong") - opcional.
  TextColumn get brand => text().nullable()();

  /// Código SKU (Código de barras o clave única comercial) - opcional.
  TextColumn get sku => text().unique().nullable()();

  /// Precio regular del producto (valor decimal).
  RealColumn get price => real()();

  /// Porcentaje de descuento aplicado actualmente (de 0.0 a 100.0, por defecto 0.0).
  RealColumn get discountPct => real().withDefault(const Constant(0.0))();

  /// Cantidad de piezas disponibles físicamente en la tienda (por defecto 0).
  IntColumn get stockQty => integer().withDefault(const Constant(0))();

  /// Límite mínimo de existencias permitido antes de alertar para reordenar (por defecto 5).
  /// Si 'stockQty' es igual o menor a esta cantidad, se genera aviso de inventario bajo.
  IntColumn get stockMinAlert => integer().withDefault(const Constant(5))();

  /// Indica si el producto está visible y a la venta en la app (por defecto verdadero).
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();

  /// Ruta de la imagen guardada temporalmente en el celular (opcional).
  TextColumn get imageLocalPath => text().nullable()();

  /// Enlace de internet de la imagen en la nube para descargarla al celular (opcional).
  TextColumn get imageRemoteUrl => text().nullable()();

  /// Especies de mascotas para las que sirve el producto.
  /// Se guarda en formato texto JSON plano, por ejemplo: '["dog", "cat"]'.
  /// Sirve para filtrar el catálogo en la interfaz.
  TextColumn get targetSpecies => text().nullable()();

  // METADATOS DE SINCRONIZACIÓN (OBLIGATORIOS)
  // Ayudan a sincronizar el stock y catálogo de productos con la nube de forma segura.

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  TextColumn get syncStatus => text().withDefault(const Constant('pending'))();
  IntColumn get syncVersion => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}
