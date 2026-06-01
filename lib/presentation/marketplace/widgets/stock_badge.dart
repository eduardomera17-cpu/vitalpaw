// lib/presentation/marketplace/widgets/stock_badge.dart

import 'package:flutter/material.dart';
import '../../../domain/marketplace/entities/product.dart';

class StockBadge extends StatelessWidget {
  final StockStatus status;

  const StockBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color color;
    switch (status) {
      case StockStatus.available:
        color = Colors.green;
        break;
      case StockStatus.lowStock:
        color = Colors.orange;
        break;
      case StockStatus.outOfStock:
        color = Colors.red;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status.label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
