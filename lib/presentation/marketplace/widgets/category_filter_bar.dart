// lib/presentation/marketplace/widgets/category_filter_bar.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/marketplace/entities/product.dart';
import '../providers/marketplace_providers.dart';

class CategoryFilterBar extends ConsumerWidget {
  const CategoryFilterBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(selectedCategoryProvider);

    return SizedBox(
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          _buildChip(context, ref, null, selectedCategory == null),
          ...ProductCategory.values.map((category) {
            return _buildChip(
              context,
              ref,
              category,
              selectedCategory == category,
            );
          }),
        ],
      ),
    );
  }

  Widget _buildChip(
    BuildContext context,
    WidgetRef ref,
    ProductCategory? category,
    bool isSelected,
  ) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(
          category == null
              ? 'Todos'
              : '${category.icon} ${category.displayName}',
        ),
        selected: isSelected,
        onSelected: (_) {
          ref.read(selectedCategoryProvider.notifier).select(category);
        },
      ),
    );
  }
}
