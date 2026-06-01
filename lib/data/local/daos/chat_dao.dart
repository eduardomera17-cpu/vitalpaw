import 'package:drift/drift.dart';
import '../database/app_database.dart';
import '../tables/chat_tables.dart';

part 'chat_dao.g.dart';

@DriftAccessor(tables: [ChatRoomsTable, ChatMessagesTable])
class ChatDao extends DatabaseAccessor<AppDatabase> with _$ChatDaoMixin {
  ChatDao(super.db);

  // -- Salas de Chat --
  Stream<List<ChatRoom>> watchChatRooms() {
    return select(chatRoomsTable).watch();
  }

  Future<void> upsertChatRoom(ChatRoomsTableCompanion room) {
    return into(chatRoomsTable).insertOnConflictUpdate(room);
  }

  // -- Mensajes --
  Stream<List<ChatMessageEntity>> watchMessagesPaginated(String roomId, int limit) {
    return (select(chatMessagesTable)
          ..where((t) => t.roomId.equals(roomId))
          ..orderBy([(t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc)])
          ..limit(limit))
        .watch();
  }

  Future<ChatMessageEntity?> getMessage(String messageId) {
    return (select(chatMessagesTable)..where((t) => t.id.equals(messageId))).getSingleOrNull();
  }

  Future<void> insertMessage(ChatMessagesTableCompanion message) {
    return into(chatMessagesTable).insert(message);
  }

  Future<void> upsertMessageFromRemote(Map<String, dynamic> data) async {
    final id = data['id'] as String;
    final roomId = data['roomId'] as String;
    final senderId = data['senderId'] as String;
    final senderRole = data['senderRole'] as String? ?? 'client';
    final type = data['type'] as String;
    final content = data['content'] as String?;
    final imageRemoteUrl = data['imageRemoteUrl'] as String?;
    final cardPayload = data['cardPayload'] as String?;
    final isRead = data['isRead'] as bool? ?? false;
    final createdAt = data['createdAt'] != null 
        ? DateTime.fromMillisecondsSinceEpoch((data['createdAt'] as num).toInt() * 1000) 
        : DateTime.now();

    final companion = ChatMessagesTableCompanion(
      id: Value(id),
      roomId: Value(roomId),
      senderId: Value(senderId),
      senderRole: Value(senderRole),
      type: Value(type),
      content: Value(content),
      imageRemoteUrl: Value(imageRemoteUrl),
      cardPayload: Value(cardPayload),
      isRead: Value(isRead),
      createdAt: Value(createdAt),
      syncStatus: const Value('synced'),
    );

    await into(chatMessagesTable).insertOnConflictUpdate(companion);
  }

  Future<void> markAsSynced(String messageId, String? remoteUrl) {
    return (update(chatMessagesTable)..where((t) => t.id.equals(messageId))).write(
      ChatMessagesTableCompanion(
        syncStatus: const Value('synced'),
        imageRemoteUrl: remoteUrl != null ? Value(remoteUrl) : const Value.absent(),
      ),
    );
  }
}
