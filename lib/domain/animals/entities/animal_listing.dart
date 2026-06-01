// lib/domain/animals/entities/animal_listing.dart

class AnimalListing {
  final String id;
  final String name;
  final AnimalSpecies species;
  final String? breed;
  final AnimalGender gender;
  final DateTime? birthDate;
  final double? weightKg;
  final String? colorDesc;
  final bool isNeutered;
  final ListingType listingType;   // sale o adoption
  final double? salePrice;
  final String description;
  final List<String> photoUrls;    // URLs remotas Firebase Storage
  final List<String> photoLocalPaths; // rutas locales Drift
  final AnimalListingStatus status;
  final String ownerId;            // pet shop staff que registró
  final String? reservedByClientId;
  final DateTime createdAt;
  final DateTime updatedAt;

  const AnimalListing({
    required this.id,
    required this.name,
    required this.species,
    this.breed,
    required this.gender,
    this.birthDate,
    this.weightKg,
    this.colorDesc,
    this.isNeutered = false,
    required this.listingType,
    this.salePrice,
    required this.description,
    this.photoUrls = const [],
    this.photoLocalPaths = const [],
    required this.status,
    required this.ownerId,
    this.reservedByClientId,
    required this.createdAt,
    required this.updatedAt,
  });

  // Edad calculada en texto legible
  String get ageLabel {
    if (birthDate == null) return 'Edad desconocida';
    final diff = DateTime.now().difference(birthDate!);
    final months = (diff.inDays / 30).floor();
    if (months < 1) return 'Menos de 1 mes';
    if (months < 12) return '$months ${months == 1 ? 'mes' : 'meses'}';
    final years = (months / 12).floor();
    final rem = months % 12;
    if (rem == 0) return '$years ${years == 1 ? 'año' : 'años'}';
    return '$years ${years == 1 ? 'año' : 'años'} y $rem ${rem == 1 ? 'mes' : 'meses'}';
  }

  bool get isAvailable => status == AnimalListingStatus.available;
  bool get isReserved  => status == AnimalListingStatus.reserved;

  // Primera foto disponible (local o remota)
  String? get coverPhoto =>
      photoUrls.isNotEmpty
          ? photoUrls.first
          : photoLocalPaths.isNotEmpty
              ? photoLocalPaths.first
              : null;
}

enum AnimalSpecies {
  dog, cat, bird, rabbit, fish, reptile, rodent, other;

  String get displayName => switch (this) {
        dog     => 'Perro',
        cat     => 'Gato',
        bird    => 'Ave',
        rabbit  => 'Conejo',
        fish    => 'Pez',
        reptile => 'Reptil',
        rodent  => 'Roedor',
        other   => 'Otro',
      };

  String get icon => switch (this) {
        dog     => '🐶',
        cat     => '🐱',
        bird    => '🦜',
        rabbit  => '🐰',
        fish    => '🐟',
        reptile => '🦎',
        rodent  => '🐭',
        other   => '🐾',
      };
}

enum AnimalGender {
  male, female, unknown;

  String get displayName => switch (this) {
        male    => 'Macho',
        female  => 'Hembra',
        unknown => 'Sin especificar',
      };
}

enum ListingType {
  sale, adoption;

  String get displayName => switch (this) {
        sale     => 'En venta',
        adoption => 'En adopción',
      };

  String get icon => switch (this) {
        sale     => '🏷️',
        adoption => '❤️',
      };
}

enum AnimalListingStatus {
  available, reserved, sold, adopted, removed;

  String get displayName => switch (this) {
        available => 'Disponible',
        reserved  => 'Reservado',
        sold      => 'Vendido',
        adopted   => 'Adoptado',
        removed   => 'Retirado',
      };
}
