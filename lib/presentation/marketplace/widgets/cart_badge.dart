// lib/presentation/marketplace/widgets/cart_badge.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/marketplace_providers.dart';

class CartBadge extends ConsumerWidget {
  final Widget child;

  const CartBadge({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalsAsync = ref.watch(cartTotalsProvider);

    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        totalsAsync.when(
          data: (totals) {
            if (totals.itemCount == 0) return const SizedBox.shrink();
            return Positioned(
              right: 0,
              top: 0,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                child: Text(
                  '${totals.itemCount}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
          loading: () => const SizedBox.shrink(),
          error: (_, __) => const SizedBox.shrink(),
        ),
      ],
    );
  }
}
