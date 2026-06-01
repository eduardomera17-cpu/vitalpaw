// lib/presentation/animals/widgets/listing_type_toggle.dart

import 'package:flutter/material.dart';
import '../../../domain/animals/entities/animal_listing.dart';

class ListingTypeToggle extends StatelessWidget {
  final ListingType? selected;
  final ValueChanged<ListingType?> onChanged;

  const ListingTypeToggle({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SegmentedButton<ListingType?>(
        segments: const [
          ButtonSegment(
            value: null,
            label: Text('Todos'),
            icon: Icon(Icons.pets),
          ),
          ButtonSegment(
            value: ListingType.adoption,
            label: Text('Adopción'),
            icon: Icon(Icons.favorite),
          ),
          ButtonSegment(
            value: ListingType.sale,
            label: Text('Venta'),
            icon: Icon(Icons.shopping_bag),
          ),
        ],
        selected: {selected},
        onSelectionChanged: (Set<ListingType?> newSelection) {
          onChanged(newSelection.first);
        },
      ),
    );
  }
}
