// lib/presentation/marketplace/product_detail_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/marketplace/entities/product.dart';
import '../../domain/marketplace/entities/marketplace_exception.dart';
import '../auth/providers/auth_providers.dart';
import 'providers/marketplace_providers.dart';
import 'widgets/price_tag.dart';
import 'widgets/stock_badge.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  ConsumerState<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  int quantity = 1;

  void _addToCart() async {
    final user = ref.read(authStateProvider).value;
    if (user == null) return;

    try {
      await ref
          .read(addToCartUseCaseProvider)
          .execute(
            clientId: user.id,
            product: widget.product,
            quantity: quantity,
          );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${widget.product.name} agregado al carrito')),
        );
        Navigator.of(context).pop();
      }
    } on MarketplaceException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message), backgroundColor: Colors.red),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error al agregar al carrito'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.product;
    final canAddToCart = p.stockQty > 0;

    return Scaffold(
      appBar: AppBar(title: Text(p.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: p.imageUrl != null
                  ? Image.network(p.imageUrl!, height: 200, fit: BoxFit.cover)
                  : const Icon(Icons.pets, size: 100, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    p.name,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                StockBadge(status: p.stockStatus),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              p.brand ?? 'Sin marca',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            PriceTag(price: p.price, discountPct: p.discountPct, isLarge: true),
            const SizedBox(height: 24),
            Text(
              'Descripción',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(p.description ?? 'No hay descripción disponible.'),
            const SizedBox(height: 32),
            if (canAddToCart)
              Row(
                children: [
                  const Text('Cantidad: ', style: TextStyle(fontSize: 16)),
                  IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: quantity > 1
                        ? () => setState(() => quantity--)
                        : null,
                  ),
                  Text(
                    '$quantity',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline),
                    onPressed: quantity < p.stockQty
                        ? () => setState(() => quantity++)
                        : null,
                  ),
                ],
              ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: canAddToCart ? _addToCart : null,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: canAddToCart
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
            ),
            child: Text(
              canAddToCart
                  ? 'Agregar al Carrito - \$${(p.finalPrice * quantity).toStringAsFixed(2)}'
                  : 'Agotado',
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
