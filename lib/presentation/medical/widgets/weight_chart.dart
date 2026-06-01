// lib/presentation/medical/widgets/weight_chart.dart

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../domain/medical/entities/weight_entry.dart';

class WeightChart extends StatelessWidget {
  final List<WeightEntry> entries;
  const WeightChart({super.key, required this.entries});

  @override
  Widget build(BuildContext context) {
    if (entries.isEmpty) return const SizedBox.shrink();

    final spots = entries
        .asMap()
        .entries
        .map((e) => FlSpot(e.key.toDouble(), e.value.weightKg))
        .toList();

    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            color: Theme.of(context).colorScheme.primary,
            barWidth: 3,
            dotData: const FlDotData(show: true),
            belowBarData: BarAreaData(
              show: true,
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.1),
            ),
          ),
        ],
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                final idx = value.toInt();
                if (idx < 0 || idx >= entries.length)
                  return const SizedBox.shrink();
                final dt = entries[idx].date;
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    '${dt.day}/${dt.month}',
                    style: const TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) => Text(
                '${value.toStringAsFixed(1)}kg',
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
              reservedSize: 44,
            ),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        gridData: const FlGridData(show: true),
        borderData: FlBorderData(show: false),
      ),
    );
  }
}
