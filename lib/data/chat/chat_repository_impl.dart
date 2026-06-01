import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import 'package:workmanager/workmanager.dart';

import '../../../domain/chat/entities/chat_message.dart';
import '../../../domain/chat/repositories/chat_repository.dart';
import '../local/database/app_database.dart';
import 'mappers/chat_mappers.dart';
import '../medical/attachment_service.dart';
import '../security/field_encryptor.dart';

class ChatRepositoryImpl implements ChatRepository {
  final FirebaseFirestore _firestore;
  final AppDatabase _db;
  final AttachmentService _attachmentService;

  ChatRepositoryImpl(this._firestore, this._db, this._attachmentService);

  @override
  Stream<List<ChatMessage>> watchMessages(String roomId, {int limit = 50}) {
    // 1. Escuchar Firestore y volcar a Drift (Merge)
    _firestore
        .collection('chats')
        .doc(roomId)
        .collection('messages')
        .orderBy('createdAt', descending: true)
        .limit(limit)
        .snapshots()
        .listen((snapshot) async {
      for (var doc in snapshot.docs) {
        final data = doc.data();
        if (data['content'] != null && data['content'].toString().isNotEmpty) {
          data['content'] = await FieldEncryptor.decrypt(data['content']);
        }
        _db.chatDao.upsertMessageFromRemote(data);
      }
    });

    // 2. La UI siempre consume de la base de datos local (Drift)
    return _db.chatDao
        .watchMessagesPaginated(roomId, limit)
        .map((entities) => entities.map((e) => ChatMappers.fromEntity(e)).toList());
  }

  @override
  Future<void> sendTextMessage({
    required String roomId,
    required String senderId,
    required String senderRole,
    required String content,
  }) async {
    final msgId = const Uuid().v4();

    await _db.chatDao.insertMessage(
      ChatMessagesTableCompanion.insert(
        id: msgId,
        roomId: roomId,
        senderId: senderId,
        senderRole: senderRole,
        type: MessageType.text.name,
        content: Value(content),
        createdAt: DateTime.now(),
        syncStatus: const Value('pending'),
      ),
    );

    // Encolar subida normal
    if (!kIsWeb) {
      Workmanager().registerOneOffTask(
        "upload_chat_text_$msgId",
        "sync_chat_task",
        inputData: {'messageId': msgId, 'roomId': roomId},
        constraints: Constraints(networkType: NetworkType.connected),
      );
    }
  }

  @override
  Future<void> sendImageOfflineFirst({
    required String roomId,
    required String senderId,
    required String senderRole,
    required File imageFile,
  }) async {
    final msgId = const Uuid().v4();

    // Comprimir en UI (AttachmentService hace la compresión WebP localmente)
    final compressedFile = await _attachmentService.compressImage(imageFile);

    // 1. Escribir en local inmediatamente
    await _db.chatDao.insertMessage(
      ChatMessagesTableCompanion.insert(
        id: msgId,
        roomId: roomId,
        senderId: senderId,
        senderRole: senderRole,
        type: MessageType.image.name,
        imageLocalPath: Value(compressedFile.path),
        createdAt: DateTime.now(),
        syncStatus: const Value('uploading_media'),
      ),
    );

    // 2. Disparar SyncWorker para media
    if (!kIsWeb) {
      Workmanager().registerOneOffTask(
        "upload_chat_image_$msgId",
        "sync_media_task",
        inputData: {'messageId': msgId, 'roomId': roomId},
        constraints: Constraints(networkType: NetworkType.connected),
      );
    }
  }

  @override
  Future<void> sendCardMessage({
    required String roomId,
    required String senderId,
    required String senderRole,
    required MessageType type,
    required String cardPayload,
  }) async {
    final msgId = const Uuid().v4();

    await _db.chatDao.insertMessage(
      ChatMessagesTableCompanion.insert(
        id: msgId,
        roomId: roomId,
        senderId: senderId,
        senderRole: senderRole,
        type: type.name,
        cardPayload: Value(cardPayload),
        createdAt: DateTime.now(),
        syncStatus: const Value('pending'),
      ),
    );

    if (!kIsWeb) {
      Workmanager().registerOneOffTask(
        "upload_chat_card_$msgId",
        "sync_chat_task",
        inputData: {'messageId': msgId, 'roomId': roomId},
        constraints: Constraints(networkType: NetworkType.connected),
      );
    }
  }
}
