import '../../../domain/chat/entities/chat_message.dart';
import '../../local/database/app_database.dart';

class ChatMappers {
  static ChatMessage fromEntity(ChatMessageEntity entity) {
    return ChatMessage(
      id: entity.id,
      roomId: entity.roomId,
      senderId: entity.senderId,
      senderRole: entity.senderRole,
      type: _parseMessageType(entity.type),
      content: entity.content,
      imageLocalPath: entity.imageLocalPath,
      imageRemoteUrl: entity.imageRemoteUrl,
      cardPayload: entity.cardPayload,
      isRead: entity.isRead,
      createdAt: entity.createdAt,
      syncStatus: _parseSyncStatus(entity.syncStatus),
    );
  }

  static MessageType _parseMessageType(String typeStr) {
    switch (typeStr) {
      case 'image':
        return MessageType.image;
      case 'product_card':
      case 'productCard':
        return MessageType.productCard;
      case 'animal_card':
      case 'animalCard':
        return MessageType.animalCard;
      case 'text':
      default:
        return MessageType.text;
    }
  }

  static SyncStatus _parseSyncStatus(String statusStr) {
    switch (statusStr) {
      case 'uploading_media':
      case 'uploadingMedia':
        return SyncStatus.uploadingMedia;
      case 'synced':
        return SyncStatus.synced;
      case 'pending':
      default:
        return SyncStatus.pending;
    }
  }
}
