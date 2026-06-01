// lib/presentation/medical/pet_history_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/medical/entities/medical_record.dart';
import '../../domain/medical/entities/weight_entry.dart';
import 'providers/medical_providers.dart';
import 'widgets/medical_record_card.dart';
import 'widgets/upcoming_dues_banner.dart';
import 'widgets/weight_chart.dart';

class PetHistoryScreen extends ConsumerStatefulWidget {
  final String petId;
  final String petName;

  const PetHistoryScreen({
    super.key,
    required this.petId,
    required this.petName,
  });

  @override
  ConsumerState<PetHistoryScreen> createState() => _PetHistoryScreenState();
}

class _PetHistoryScreenState extends ConsumerState<PetHistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Historia Clínica', style: TextStyle(fontSize: 16)),
            Text(
              widget.petName,
              style: TextStyle(
                fontSize: 13,
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Historial'),
            Tab(text: 'Peso'),
            Tab(text: 'Próximas'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _HistoryTab(petId: widget.petId),
          _WeightTab(petId: widget.petId),
          _UpcomingDuesTab(petId: widget.petId),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () =>
            context.push('/medical/${widget.petId}/add', extra: widget.petName),
        icon: const Icon(Icons.add),
        label: const Text('Nuevo registro'),
      ),
    );
  }
}

// ── TAB: Historial completo ───────────────────────────────────────────────────

class _HistoryTab extends ConsumerStatefulWidget {
  final String petId;
  const _HistoryTab({required this.petId});

  @override
  ConsumerState<_HistoryTab> createState() => _HistoryTabState();
}

class _HistoryTabState extends ConsumerState<_HistoryTab> {
  MedicalRecordType? _filter;

  @override
  Widget build(BuildContext context) {
    final records = _filter == null
        ? ref.watch(petHistoryProvider(widget.petId))
        : ref.watch(
            petHistoryByTypeProvider((petId: widget.petId, type: _filter!)),
          );

    return Column(
      children: [
        // Filtros horizontales por tipo
        SizedBox(
          height: 52,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            children: [
              FilterChip(
                label: const Text('Todos'),
                selected: _filter == null,
                onSelected: (_) => setState(() => _filter = null),
              ),
              const SizedBox(width: 8),
              ...MedicalRecordType.values.map(
                (type) => Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: FilterChip(
                    label: Text('${type.icon} ${type.displayName}'),
                    selected: _filter == type,
                    onSelected: (_) => setState(() => _filter = type),
                    selectedColor: Color(
                      type.accentColor,
                    ).withValues(alpha: 0.2),
                    checkmarkColor: Color(type.accentColor),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 1),
        Expanded(
          child: records.when(
            data: (list) {
              if (list.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.folder_open_outlined,
                        size: 56,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _filter == null
                            ? 'Sin registros clínicos aún'
                            : 'Sin registros de ${_filter!.displayName}',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                );
              }
              return ListView.separated(
                padding: const EdgeInsets.all(12),
                itemCount: list.length,
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemBuilder: (context, index) =>
                    MedicalRecordCard(record: list[index]),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Error: $e')),
          ),
        ),
      ],
    );
  }
}

// ── TAB: Evolución de peso ────────────────────────────────────────────────────

class _WeightTab extends ConsumerWidget {
  final String petId;
  const _WeightTab({required this.petId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weights = ref.watch(weightHistoryProvider(petId));

    return weights.when(
      data: (entries) {
        if (entries.isEmpty) {
          return const Center(
            child: Text(
              'Sin registros de peso aún',
              style: TextStyle(color: Colors.grey),
            ),
          );
        }
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Peso actual
              _WeightSummary(entries: entries),
              const SizedBox(height: 20),
              // Gráfico
              SizedBox(height: 220, child: WeightChart(entries: entries)),
              const SizedBox(height: 20),
              // Lista compacta
              Text('Historial', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 8),
              ...entries.reversed.map((e) => _WeightRow(entry: e)),
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
    );
  }
}

class _WeightSummary extends StatelessWidget {
  final List<WeightEntry> entries;
  const _WeightSummary({required this.entries});

  @override
  Widget build(BuildContext context) {
    final latest = entries.last;
    final previous = entries.length > 1 ? entries[entries.length - 2] : null;
    final diff = previous != null ? latest.weightKg - previous.weightKg : null;

    return Row(
      children: [
        Expanded(
          child: _StatCard(
            label: 'Peso actual',
            value: '${latest.weightKg.toStringAsFixed(1)} kg',
            icon: Icons.monitor_weight_outlined,
          ),
        ),
        if (diff != null) ...[
          const SizedBox(width: 12),
          Expanded(
            child: _StatCard(
              label: 'Variación',
              value: '${diff >= 0 ? '+' : ''}${diff.toStringAsFixed(1)} kg',
              icon: diff >= 0 ? Icons.trending_up : Icons.trending_down,
              valueColor: diff >= 0 ? Colors.orange : Colors.green,
            ),
          ),
        ],
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color? valueColor;

  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Colors.grey),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _WeightRow extends StatelessWidget {
  final WeightEntry entry;
  const _WeightRow({required this.entry});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const Icon(Icons.circle, size: 8, color: Colors.blue),
          const SizedBox(width: 10),
          Text(
            _formatDate(entry.date),
            style: const TextStyle(color: Colors.grey, fontSize: 13),
          ),
          const Spacer(),
          Text(
            '${entry.weightKg.toStringAsFixed(1)} kg',
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime dt) {
    const months = [
      '',
      'ene',
      'feb',
      'mar',
      'abr',
      'may',
      'jun',
      'jul',
      'ago',
      'sep',
      'oct',
      'nov',
      'dic',
    ];
    return '${dt.day} ${months[dt.month]} ${dt.year}';
  }
}

// ── TAB: Próximas dosis ───────────────────────────────────────────────────────

class _UpcomingDuesTab extends ConsumerWidget {
  final String petId;
  const _UpcomingDuesTab({required this.petId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final upcoming = ref.watch(upcomingDuesProvider(petId));

    return upcoming.when(
      data: (list) {
        if (list.isEmpty) {
          return const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.check_circle_outline, size: 56, color: Colors.green),
                SizedBox(height: 10),
                Text(
                  'Sin vencimientos próximos',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          );
        }
        return ListView.separated(
          padding: const EdgeInsets.all(12),
          itemCount: list.length,
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemBuilder: (context, index) => UpcomingDueCard(record: list[index]),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
    );
  }
}
