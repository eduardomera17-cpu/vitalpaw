import 'package:equatable/equatable.dart';
import 'chat_message.dart';

class ChatRoomDomain extends Equatable {
  final String id; // clientId
  final String clientName;
  final String? lastMessage;
  final MessageType? lastMessageType;
  final DateTime? lastMessageAt;
  final int unreadByAdmin;
  final int unreadByClient;
  final DateTime updatedAt;

  const ChatRoomDomain({
    required this.id,
    required this.clientName,
    this.lastMessage,
    this.lastMessageType,
    this.lastMessageAt,
    this.unreadByAdmin = 0,
    this.unreadByClient = 0,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        clientName,
        lastMessage,
        lastMessageType,
        lastMessageAt,
        unreadByAdmin,
        unreadByClient,
        updatedAt,
      ];
}
