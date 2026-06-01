import 'package:equatable/equatable.dart';

enum MessageType { text, image, productCard, animalCard }

enum SyncStatus { pending, uploadingMedia, synced }

class ChatMessage extends Equatable {
  final String id;
  final String roomId;
  final String senderId;
  final String senderRole; // 'client' | 'staff' | 'admin'
  final MessageType type;

  final String? content;
  final String? imageLocalPath;
  final String? imageRemoteUrl;
  final String? cardPayload;

  final bool isRead;
  final DateTime createdAt;
  final SyncStatus syncStatus;

  const ChatMessage({
    required this.id,
    required this.roomId,
    required this.senderId,
    required this.senderRole,
    required this.type,
    this.content,
    this.imageLocalPath,
    this.imageRemoteUrl,
    this.cardPayload,
    this.isRead = false,
    required this.createdAt,
    this.syncStatus = SyncStatus.pending,
  });

  @override
  List<Object?> get props => [
        id,
        roomId,
        senderId,
        senderRole,
        type,
        content,
        imageLocalPath,
        imageRemoteUrl,
        cardPayload,
        isRead,
        createdAt,
        syncStatus,
      ];
}
