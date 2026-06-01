// lib/presentation/medical/widgets/attachment_picker.dart

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AttachmentPicker extends StatelessWidget {
  final String? currentPath;
  final ValueChanged<String> onPicked;
  final VoidCallback onRemoved;

  const AttachmentPicker({
    super.key,
    required this.currentPath,
    required this.onPicked,
    required this.onRemoved,
  });

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: source, imageQuality: 90);
    if (file != null) {
      onPicked(file.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (currentPath != null) {
      return Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.file(
              File(currentPath!),
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: CircleAvatar(
              backgroundColor: Colors.black54,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: onRemoved,
              ),
            ),
          ),
        ],
      );
    }

    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => _pickImage(ImageSource.camera),
            icon: const Icon(Icons.camera_alt_outlined),
            label: const Text('Cámara'),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => _pickImage(ImageSource.gallery),
            icon: const Icon(Icons.photo_library_outlined),
            label: const Text('Galería'),
          ),
        ),
      ],
    );
  }
}
