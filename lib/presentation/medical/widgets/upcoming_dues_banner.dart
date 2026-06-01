// lib/presentation/medical/widgets/upcoming_dues_banner.dart

import 'package:flutter/material.dart';
import '../../../domain/medical/entities/medical_record.dart';

class UpcomingDuesBanner extends StatelessWidget {
  final MedicalRecord record;
  const UpcomingDuesBanner({super.key, required this.record});

  @override
  Widget build(BuildContext context) {
    if (record.nextDueDate == null) return const SizedBox.shrink();

    final isOverdue = record.isOverdue;
    final isSoon = record.isDueSoon;

    Color bgColor = Colors.grey.shade100;
    Color textColor = Colors.grey.shade700;
    String text = 'Próxima: ${_formatDate(record.nextDueDate!)}';

    if (isOverdue) {
      bgColor = Colors.red.shade50;
      textColor = Colors.red.shade700;
      text = 'Vencido: ${_formatDate(record.nextDueDate!)}';
    } else if (isSoon) {
      bgColor = Colors.orange.shade50;
      textColor = Colors.orange.shade700;
      text = 'Pronto: ${_formatDate(record.nextDueDate!)}';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11,
          color: textColor,
          fontWeight: FontWeight.w500,
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

class UpcomingDueCard extends StatelessWidget {
  final MedicalRecord record;
  const UpcomingDueCard({super.key, required this.record});

  @override
  Widget build(BuildContext context) {
    final isOverdue = record.isOverdue;

    return Card(
      color: isOverdue ? Colors.red.shade50 : Colors.orange.shade50,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: isOverdue ? Colors.red.shade200 : Colors.orange.shade200,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Icon(
              isOverdue ? Icons.warning_amber_rounded : Icons.schedule,
              color: isOverdue ? Colors.red : Colors.orange,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${record.recordType.icon} ${record.title}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Aplicación anterior: ${_formatDate(record.createdAt)}',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  isOverdue ? 'Vencido' : 'Próximo',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: isOverdue ? Colors.red : Colors.orange,
                  ),
                ),
                Text(
                  _formatDate(record.nextDueDate!),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
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
