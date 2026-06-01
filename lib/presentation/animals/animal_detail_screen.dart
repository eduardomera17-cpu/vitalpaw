// lib/presentation/animals/animal_detail_screen.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../domain/animals/entities/animal_listing.dart';
import '../../../domain/animals/entities/care_guide.dart';
import 'widgets/photo_gallery.dart';
import 'widgets/care_guide_section.dart';

class AnimalDetailScreen extends StatelessWidget {
  final AnimalListing listing;

  const AnimalDetailScreen({super.key, required this.listing});

  @override
  Widget build(BuildContext context) {
    final careGuide = CareGuideData.forSpecies(listing.species);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // AppBar transparente con foto expansible
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: PhotoGallery(
                photoUrls: listing.photoUrls,
                photoLocalPaths: listing.photoLocalPaths,
                species: listing.species,
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Cabecera: Nombre y Precio/Tipo
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          listing.name,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      if (listing.listingType == ListingType.sale && listing.salePrice != null)
                        Text(
                          '\$${listing.salePrice!.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        )
                      else
                        const Chip(
                          label: Text('Adopción'),
                          backgroundColor: Colors.pinkAccent,
                          labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Especie y Raza
                  Text(
                    '${listing.species.displayName} ${listing.breed != null ? "· ${listing.breed}" : ""}',
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),

                  const SizedBox(height: 24),

                  // Fila de Características (Edad, Género, Peso)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _FeatureBox(icon: '🎂', title: 'Edad', value: listing.ageLabel),
                      _FeatureBox(icon: listing.gender == AnimalGender.male ? '♂️' : '♀️', title: 'Sexo', value: listing.gender.displayName),
                      _FeatureBox(icon: '⚖️', title: 'Peso', value: listing.weightKg != null ? '${listing.weightKg} kg' : 'N/A'),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // Sobre Mí (Descripción)
                  const Text('Sobre mí', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Text(
                    listing.description,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),

                  const SizedBox(height: 32),

                  // Guía de Cuidados
                  if (careGuide != null) ...[
                    Text(careGuide.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    CareGuideSection(guide: careGuide),
                  ],
                  
                  const SizedBox(height: 80), // Espacio para el FAB o botón fijo
                ],
              ),
            ),
          ),
        ],
      ),

      // Botón Inferior Flotante Extendido
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton.icon(
            icon: Icon(listing.listingType == ListingType.sale ? Icons.shopping_cart : Icons.favorite),
            label: Text(
              listing.listingType == ListingType.sale ? 'Comprar / Reservar' : 'Solicitar Adopción',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: listing.listingType == ListingType.sale 
                  ? Theme.of(context).colorScheme.primary 
                  : Colors.pink,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
            onPressed: () {
              context.push('/animals/request', extra: listing);
            },
          ),
        ),
      ),
    );
  }
}

class _FeatureBox extends StatelessWidget {
  final String icon;
  final String title;
  final String value;

  const _FeatureBox({required this.icon, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(icon, style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        ],
      ),
    );
  }
}
