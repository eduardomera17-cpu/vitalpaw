// lib/presentation/animals/animal_catalog_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/animal_providers.dart';
import 'widgets/animal_card.dart';
import 'widgets/species_filter_bar.dart';
import 'widgets/listing_type_toggle.dart';

class AnimalCatalogScreen extends ConsumerWidget {
  const AnimalCatalogScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listingsAsync = ref.watch(animalListingsProvider);
    final currentFilter = ref.watch(animalListingsFilterProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      appBar: AppBar(
        title: const Text('Compañeros de Vida', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              // TODO: Ir a mis favoritos o solicitudes
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Filtro Venta / Adopción
          ListingTypeToggle(
            selected: currentFilter.type,
            onChanged: (type) {
              ref.read(animalListingsFilterProvider.notifier).updateFilter(
                AnimalListingsFilter(species: currentFilter.species, type: type),
              );
            },
          ),
          
          // Filtro por Especie (Perro, Gato, etc.)
          SpeciesFilterBar(
            selected: currentFilter.species,
            onSelected: (species) {
              ref.read(animalListingsFilterProvider.notifier).updateFilter(
                AnimalListingsFilter(species: species, type: currentFilter.type),
              );
            },
          ),

          const SizedBox(height: 8),

          // Grilla de Animales
          Expanded(
            child: listingsAsync.when(
              data: (listings) {
                if (listings.isEmpty) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('🐾', style: TextStyle(fontSize: 64)),
                        SizedBox(height: 16),
                        Text(
                          'No hay peluditos disponibles\ncon estos filtros',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                }

                return GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: listings.length,
                  itemBuilder: (context, index) {
                    return AnimalCard(listing: listings[index]);
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text('Error: $err')),
            ),
          ),
        ],
      ),
    );
  }
}
