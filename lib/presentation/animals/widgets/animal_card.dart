// lib/presentation/animals/widgets/animal_card.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../domain/animals/entities/animal_listing.dart';

class AnimalCard extends StatelessWidget {
  final AnimalListing listing;
  const AnimalCard({super.key, required this.listing});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () => context.push('/animals/${listing.id}', extra: listing),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.07),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Foto
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: listing.coverPhoto != null
                      ? CachedNetworkImage(
                          imageUrl: listing.coverPhoto!,
                          height: 140,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorWidget: (_, __, ___) =>
                              _AnimalPhotoPlaceholder(
                                  species: listing.species),
                        )
                      : _AnimalPhotoPlaceholder(
                          species: listing.species),
                ),

                // Badge tipo (venta / adopción)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: listing.listingType == ListingType.adoption
                          ? Colors.pink.shade400
                          : Colors.blue.shade600,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      listing.listingType.displayName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                // Badge reservado
                if (listing.isReserved)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade600,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        'Reservado',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            // Datos
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(listing.species.icon,
                          style: const TextStyle(fontSize: 14)),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          listing.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  if (listing.breed != null)
                    Text(
                      listing.breed!,
                      style: const TextStyle(
                          fontSize: 12, color: Colors.grey),
                    ),
                  const SizedBox(height: 4),
                  Text(
                    listing.ageLabel,
                    style: const TextStyle(
                        fontSize: 11, color: Colors.grey),
                  ),
                  const SizedBox(height: 6),

                  // Precio o "Adopción gratuita"
                  listing.listingType == ListingType.sale &&
                          listing.salePrice != null
                      ? Text(
                          '\$${listing.salePrice!.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color:
                                Theme.of(context).colorScheme.primary,
                          ),
                        )
                      : const Text(
                          '❤️ Adopción',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.pink,
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AnimalPhotoPlaceholder extends StatelessWidget {
  final AnimalSpecies species;
  const _AnimalPhotoPlaceholder({required this.species});

  @override
  Widget build(BuildContext context) => Container(
        height: 140,
        color: Colors.grey.shade100,
        child: Center(
          child: Text(
            species.icon,
            style: const TextStyle(fontSize: 52),
          ),
        ),
      );
}
