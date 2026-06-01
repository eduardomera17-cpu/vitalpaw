// lib/presentation/marketplace/widgets/price_tag.dart

import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget {
  final double price;
  final double discountPct;
  final bool isLarge;

  const PriceTag({
    super.key,
    required this.price,
    this.discountPct = 0.0,
    this.isLarge = false,
  });

  @override
  Widget build(BuildContext context) {
    final finalPrice = price * (1 - discountPct / 100);
    final hasDiscount = discountPct > 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasDiscount)
          Row(
            children: [
              Text(
                '\$${price.toStringAsFixed(2)}',
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey,
                  fontSize: isLarge ? 16 : 12,
                ),
              ),
              const SizedBox(width: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.red.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '-${discountPct.toInt()}%',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: isLarge ? 12 : 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        Text(
          '\$${finalPrice.toStringAsFixed(2)}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: isLarge ? 24 : 16,
            color: hasDiscount ? Colors.red : null,
          ),
        ),
      ],
    );
  }
}
