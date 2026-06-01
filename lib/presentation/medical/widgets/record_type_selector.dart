// lib/presentation/medical/widgets/record_type_selector.dart

import 'package:flutter/material.dart';
import '../../../domain/medical/entities/medical_record.dart';

class RecordTypeSelector extends StatelessWidget {
  final MedicalRecordType selected;
  final ValueChanged<MedicalRecordType> onSelected;

  const RecordTypeSelector({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: MedicalRecordType.values.map((type) {
        final isSelected = type == selected;
        return FilterChip(
          label: Text('${type.icon} ${type.displayName}'),
          selected: isSelected,
          onSelected: (_) => onSelected(type),
          selectedColor: Color(type.accentColor).withValues(alpha: 0.2),
          checkmarkColor: Color(type.accentColor),
        );
      }).toList(),
    );
  }
}
