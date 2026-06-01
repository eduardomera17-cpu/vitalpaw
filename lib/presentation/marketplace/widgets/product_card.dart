// lib/presentation/marketplace/widgets/product_card.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../domain/marketplace/entities/product.dart';
import 'price_tag.dart';
import 'stock_badge.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/catalog/${product.id}', extra: product),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  if (product.imageUrl != null)
                    Image.network(product.imageUrl!, fit: BoxFit.cover)
                  else
                    Container(
                      color: Colors.grey.shade200,
                      child: const Icon(
                        Icons.pets,
                        size: 40,
                        color: Colors.grey,
                      ),
                    ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: StockBadge(status: product.stockStatus),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  if (product.brand != null)
                    Text(
                      product.brand!,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  const SizedBox(height: 8),
                  PriceTag(
                    price: product.price,
                    discountPct: product.discountPct,
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
