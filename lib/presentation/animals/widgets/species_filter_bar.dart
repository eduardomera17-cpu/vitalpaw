// lib/presentation/animals/widgets/species_filter_bar.dart

import 'package:flutter/material.dart';
import '../../../domain/animals/entities/animal_listing.dart';

class SpeciesFilterBar extends StatelessWidget {
  final AnimalSpecies? selected;
  final ValueChanged<AnimalSpecies?> onSelected;

  const SpeciesFilterBar({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: AnimalSpecies.values.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _FilterChip(
              label: 'Todos',
              icon: '🐾',
              isSelected: selected == null,
              onTap: () => onSelected(null),
            );
          }
          final species = AnimalSpecies.values[index - 1];
          return _FilterChip(
            label: species.displayName,
            icon: species.icon,
            isSelected: selected == species,
            onTap: () => onSelected(species),
          );
        },
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final String icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text('$icon $label'),
        selected: isSelected,
        onSelected: (_) => onTap(),
        selectedColor: Theme.of(context).colorScheme.primaryContainer,
        labelStyle: TextStyle(
          color: isSelected
              ? Theme.of(context).colorScheme.onPrimaryContainer
              : Theme.of(context).colorScheme.onSurface,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
