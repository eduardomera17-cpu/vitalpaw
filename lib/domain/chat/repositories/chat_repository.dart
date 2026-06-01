import 'dart:io';
import '../entities/chat_message.dart';

abstract class ChatRepository {
  Stream<List<ChatMessage>> watchMessages(String roomId, {int limit = 50});
  
  Future<void> sendTextMessage({
    required String roomId,
    required String senderId,
    required String senderRole,
    required String content,
  });

  Future<void> sendImageOfflineFirst({
    required String roomId,
    required String senderId,
    required String senderRole,
    required File imageFile,
  });

  Future<void> sendCardMessage({
    required String roomId,
    required String senderId,
    required String senderRole,
    required MessageType type,
    required String cardPayload,
  });
}
