// lib/presentation/medical/record_detail_screen.dart

import 'dart:io';
import 'package:flutter/material.dart';
import '../../domain/medical/entities/medical_record.dart';

class RecordDetailScreen extends StatelessWidget {
  final MedicalRecord record;
  const RecordDetailScreen({super.key, required this.record});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(record.recordType.displayName),
        actions: [
          if (record.hasConflict)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(Icons.warning_amber_rounded, color: Colors.red),
            ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Título y fecha
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(
                    record.recordType.accentColor,
                  ).withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  record.recordType.icon,
                  style: const TextStyle(fontSize: 28),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      record.title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _formatDateTime(record.createdAt),
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Veterinario
          Row(
            children: [
              const Icon(Icons.person_outline, color: Colors.grey, size: 20),
              const SizedBox(width: 8),
              Text(
                'Atendido por: ${record.vetName}',
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const Divider(height: 32),

          // Descripción principal
          Text(
            'Observaciones médicas',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            record.description,
            style: const TextStyle(fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 24),

          // Campos específicos (Peso, Medicación, Próxima Dosis)
          if (record.weightKg != null ||
              record.medicationName != null ||
              record.nextDueDate != null) ...[
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(
                  context,
                ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  if (record.weightKg != null)
                    _InfoRow(
                      icon: Icons.monitor_weight_outlined,
                      label: 'Peso registrado',
                      value: '${record.weightKg!.toStringAsFixed(1)} kg',
                    ),
                  if (record.medicationName != null) ...[
                    if (record.weightKg != null) const Divider(),
                    _InfoRow(
                      icon: Icons.medication_outlined,
                      label: 'Medicación',
                      value: record.medicationName!,
                    ),
                    if (record.dosage != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4, left: 28),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Dosis: ${record.dosage!}',
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                  ],
                  if (record.nextDueDate != null) ...[
                    if (record.weightKg != null ||
                        record.medicationName != null)
                      const Divider(),
                    _InfoRow(
                      icon: Icons.event_outlined,
                      label: 'Próxima aplicación',
                      value: _formatDate(record.nextDueDate!),
                      valueColor: record.isOverdue ? Colors.red : null,
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],

          // Adjuntos
          if (record.hasAttachment) ...[
            Text(
              'Archivo adjunto',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: record.attachmentLocalPath != null
                  ? Image.file(
                      File(record.attachmentLocalPath!),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      record.attachmentRemoteUrl!,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const SizedBox(
                          height: 200,
                          child: Center(child: CircularProgressIndicator()),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 200,
                          color: Colors.grey.shade200,
                          child: const Center(
                            child: Icon(
                              Icons.broken_image_outlined,
                              size: 48,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      },
                    ),
            ),
            const SizedBox(height: 24),
          ],

          // Conflictos (Admin)
          if (record.conflictNotes != null) ...[
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                border: Border.all(color: Colors.orange.shade200),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.admin_panel_settings_outlined,
                        color: Colors.orange,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Nota de resolución administrativa',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    record.conflictNotes!,
                    style: const TextStyle(color: Colors.black87),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
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

  String _formatDateTime(DateTime dt) {
    return '${_formatDate(dt)} - ${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(color: Colors.grey)),
          const Spacer(),
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.w600, color: valueColor),
          ),
        ],
      ),
    );
  }
}
