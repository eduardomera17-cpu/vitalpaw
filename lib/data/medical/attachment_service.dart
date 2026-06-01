// lib/data/medical/attachment_service.dart

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AttachmentService {
  final FirebaseStorage _storage;

  AttachmentService({FirebaseStorage? storage})
    : _storage = storage ?? FirebaseStorage.instance;

  /// Comprime y sube una imagen a Firebase Storage.
  /// Retorna la URL de descarga pública.
  Future<String> uploadAttachment({
    required String localPath,
    required String remotePath,
  }) async {
    final file = File(localPath);
    if (!file.existsSync()) {
      throw Exception('Archivo no encontrado: $localPath');
    }

    // Comprimir imagen antes de subir (máx 800px, calidad 80)
    final compressed = await compressImage(file);

    final ref = _storage.ref(remotePath);
    final uploadTask = ref.putFile(
      compressed,
      SettableMetadata(contentType: 'image/jpeg'),
    );

    // Esperar a que termine de subir
    await uploadTask;
    return ref.getDownloadURL();
  }

  /// Eliminar adjunto de Storage (al hacer soft-delete del registro).
  Future<void> deleteAttachment(String remotePath) async {
    try {
      await _storage.ref(remotePath).delete();
    } catch (_) {
      // Ignorar si ya no existe
    }
  }

  Future<File> compressImage(File source) async {
    final bytes = await source.readAsBytes();
    var image = img.decodeImage(bytes);
    if (image == null) return source;

    // Redimensionar si es mayor a 800px en el lado largo
    if (image.width > 800 || image.height > 800) {
      image = img.copyResize(
        image,
        width: image.width > image.height ? 800 : null,
        height: image.height >= image.width ? 800 : null,
      );
    }

    final compressed = img.encodeJpg(image, quality: 80);
    final tempDir = await getTemporaryDirectory();
    final tempFile = File(
      '${tempDir.path}/compressed_${DateTime.now().millisecondsSinceEpoch}.jpg',
    );
    await tempFile.writeAsBytes(compressed);
    return tempFile;
  }
}

// Provider
final attachmentServiceProvider = Provider<AttachmentService>(
  (ref) => AttachmentService(),
);
