// lib/presentation/animals/widgets/care_guide_section.dart

import 'package:flutter/material.dart';
import '../../../domain/animals/entities/care_guide.dart';

class CareGuideSection extends StatelessWidget {
  final CareGuide guide;

  const CareGuideSection({super.key, required this.guide});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: guide.sections.map((section) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(section.icon, style: const TextStyle(fontSize: 24)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      section.title,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      section.content,
                      style: TextStyle(color: Colors.grey.shade700, height: 1.5),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
