// lib/presentation/medical/conflict_resolver_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/medical/entities/medical_record.dart';
import 'providers/medical_providers.dart';

class ConflictResolverScreen extends ConsumerWidget {
  const ConflictResolverScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final conflicts = ref.watch(medicalConflictsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Conflictos clínicos'),
        actions: [
          // Badge con número de conflictos
          conflicts.maybeWhen(
            data: (list) => list.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Chip(
                      label: Text('${list.length}'),
                      backgroundColor: Colors.red,
                      labelStyle: const TextStyle(color: Colors.white),
                    ),
                  )
                : const SizedBox.shrink(),
            orElse: () => const SizedBox.shrink(),
          ),
        ],
      ),
      body: conflicts.when(
        data: (list) {
          if (list.isEmpty) {
            return const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.verified_outlined, size: 64, color: Colors.green),
                  SizedBox(height: 12),
                  Text(
                    'Sin conflictos pendientes',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: list.length,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) => _ConflictCard(record: list[index]),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}

class _ConflictCard extends ConsumerWidget {
  final MedicalRecord record;
  const _ConflictCard({required this.record});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.red.shade300, width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Encabezado
            Row(
              children: [
                const Icon(
                  Icons.warning_amber_rounded,
                  color: Colors.red,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '${record.recordType.icon} ${record.title}',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              record.description,
              style: const TextStyle(fontSize: 13, color: Colors.black87),
            ),
            const SizedBox(height: 4),
            Text(
              'Creado: ${_formatDateTime(record.createdAt)}',
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
            const SizedBox(height: 12),
            const Divider(),
            const SizedBox(height: 8),

            // Formulario de resolución
            Text(
              'Notas de resolución',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: 6),
            _ConflictResolutionForm(record: record),
          ],
        ),
      ),
    );
  }

  String _formatDateTime(DateTime dt) {
    return '${dt.day}/${dt.month}/${dt.year} '
        '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
  }
}

class _ConflictResolutionForm extends ConsumerStatefulWidget {
  final MedicalRecord record;
  const _ConflictResolutionForm({required this.record});

  @override
  ConsumerState<_ConflictResolutionForm> createState() =>
      _ConflictResolutionFormState();
}

class _ConflictResolutionFormState
    extends ConsumerState<_ConflictResolutionForm> {
  final _notesController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _resolve() async {
    if (_notesController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Escribe las notas de resolución'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      await ref
          .read(resolveConflictUseCaseProvider)
          .execute(
            recordId: widget.record.id,
            adminNotes: _notesController.text.trim(),
          );
      // Refrescar lista de conflictos
      ref.invalidate(medicalConflictsProvider);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('✅ Conflicto resuelto'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _notesController,
          maxLines: 3,
          decoration: const InputDecoration(
            hintText: 'Describe cómo se resolvió el conflicto de versión…',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: FilledButton.icon(
            onPressed: _isLoading ? null : _resolve,
            icon: _isLoading
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Icon(Icons.check_circle_outline),
            label: const Text('Marcar como resuelto'),
            style: FilledButton.styleFrom(backgroundColor: Colors.green),
          ),
        ),
      ],
    );
  }
}
