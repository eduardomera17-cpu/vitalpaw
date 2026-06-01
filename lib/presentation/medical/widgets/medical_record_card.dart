// lib/presentation/medical/widgets/medical_record_card.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../domain/medical/entities/medical_record.dart';
import 'upcoming_dues_banner.dart';

class MedicalRecordCard extends StatelessWidget {
  final MedicalRecord record;
  const MedicalRecordCard({super.key, required this.record});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => context.push('/medical/record/${record.id}', extra: record),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: Color(record.recordType.accentColor),
              width: 4,
            ),
          ),
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  record.recordType.icon,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    record.title,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                // Badge de conflicto
                if (record.hasConflict)
                  const Tooltip(
                    message: 'Conflicto pendiente de resolución',
                    child: Icon(
                      Icons.warning_amber_rounded,
                      color: Colors.red,
                      size: 18,
                    ),
                  ),
                // Badge de adjunto
                if (record.hasAttachment)
                  const Icon(
                    Icons.attach_file_outlined,
                    size: 16,
                    color: Colors.grey,
                  ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              record.description,
              style: const TextStyle(fontSize: 13, color: Colors.black87),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  _formatDate(record.createdAt),
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
                if (record.nextDueDate != null) ...[
                  const Spacer(),
                  UpcomingDuesBanner(record: record),
                ],
              ],
            ),
          ],
        ),
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
