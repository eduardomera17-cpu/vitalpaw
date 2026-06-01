import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:workmanager/workmanager.dart';

import '../local/database/app_database.dart';
import '../security/field_encryptor.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  if (kIsWeb) return;
  Workmanager().executeTask((task, inputData) async {
    if (inputData == null) return false;
    
    final messageId = inputData['messageId'] as String;
    final roomId = inputData['roomId'] as String;
    
    // Deberíamos inyectar esto propiamente, pero para background tasks a veces
    // se crea una instancia directa si no hay dependencias. 
    // Supondremos que inicializa la BD.
    final db = AppDatabase();
    
    try {
      if (task == "sync_media_task") {
        return await processMediaUpload(db, messageId, roomId);
      } else if (task == "sync_chat_task") {
        return await processChatTextUpload(db, messageId, roomId);
      }
      return true;
    } catch (e) {
      return false; // Workmanager reintentará aplicando Exponential Backoff
    } finally {
      await db.close();
    }
  });
}

Future<bool> processMediaUpload(AppDatabase db, String messageId, String roomId) async {
  final localMessage = await db.chatDao.getMessage(messageId);
  if (localMessage == null || localMessage.syncStatus != 'uploading_media') return true;

  try {
    // 1. Subir a Firebase Storage
    if (localMessage.imageLocalPath == null) return false;
    
    final file = File(localMessage.imageLocalPath!);
    if (!file.existsSync()) return false;

    final ref = FirebaseStorage.instance.ref('chats/$roomId/$messageId.webp');
    await ref.putFile(file);
    final remoteUrl = await ref.getDownloadURL();

    // 2. Actualizar documento en Firestore
    final payload = {
      'id': messageId,
      'roomId': roomId,
      'senderId': localMessage.senderId,
      'senderRole': localMessage.senderRole,
      'type': 'image',
      'imageRemoteUrl': remoteUrl,
      'isRead': false,
      'createdAt': Timestamp.fromDate(localMessage.createdAt),
    };
    
    await FirebaseFirestore.instance
        .collection('chats')
        .doc(roomId)
        .collection('messages')
        .doc(messageId)
        .set(payload);

    // 3. Marcar como sincronizado en local
    await db.chatDao.markAsSynced(messageId, remoteUrl);
    
    // Limpiar archivo temporal si se desea
    if (file.existsSync()) file.deleteSync();
    
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> processChatTextUpload(AppDatabase db, String messageId, String roomId) async {
  final localMessage = await db.chatDao.getMessage(messageId);
  if (localMessage == null || localMessage.syncStatus != 'pending') return true;

  try {
    String? encryptedContent = localMessage.content;
    if (encryptedContent != null && encryptedContent.isNotEmpty) {
      encryptedContent = await FieldEncryptor.encrypt(encryptedContent);
    }

    final payload = {
      'id': messageId,
      'roomId': roomId,
      'senderId': localMessage.senderId,
      'senderRole': localMessage.senderRole,
      'type': localMessage.type,
      'content': encryptedContent,
      'cardPayload': localMessage.cardPayload,
      'isRead': false,
      'createdAt': Timestamp.fromDate(localMessage.createdAt),
    };

    await FirebaseFirestore.instance
        .collection('chats')
        .doc(roomId)
        .collection('messages')
        .doc(messageId)
        .set(payload);

    await db.chatDao.markAsSynced(messageId, null);
    return true;
  } catch (e) {
    return false;
  }
}
