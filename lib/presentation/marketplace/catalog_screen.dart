// lib/presentation/marketplace/catalog_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'providers/marketplace_providers.dart';
import 'widgets/product_card.dart';
import 'widgets/category_filter_bar.dart';
import 'widgets/cart_badge.dart';

class CatalogScreen extends ConsumerWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final catalogAsync = ref.watch(activeCatalogProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Productos'),
        actions: [
          IconButton(
            icon: const CartBadge(child: Icon(Icons.shopping_cart)),
            onPressed: () => context.push('/cart'),
          ),
        ],
      ),
      body: Column(
        children: [
          const CategoryFilterBar(),
          Expanded(
            child: catalogAsync.when(
              data: (products) {
                if (products.isEmpty) {
                  return const Center(
                    child: Text(
                      'No hay productos disponibles en esta categoría.',
                    ),
                  );
                }
                return GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.65,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ProductCard(product: products[index]);
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
