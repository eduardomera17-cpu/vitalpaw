// lib/domain/medical/entities/weight_entry.dart
// Vista proyectada de los registros de tipo weightCheck para el gráfico.

class WeightEntry {
  final DateTime date;
  final double weightKg;
  final String recordId;

  const WeightEntry({
    required this.date,
    required this.weightKg,
    required this.recordId,
  });
}
