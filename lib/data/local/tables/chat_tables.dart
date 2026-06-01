import 'package:drift/drift.dart';

@DataClassName('ChatRoom')
class ChatRoomsTable extends Table {
  TextColumn get id            => text()();  // clientId
  TextColumn get clientName    => text()();
  TextColumn get lastMessage   => text().nullable()();
  TextColumn get lastMessageType => text().nullable()();
  DateTimeColumn get lastMessageAt => dateTime().nullable()();
  IntColumn get unreadByAdmin  => integer().withDefault(const Constant(0))();
  IntColumn get unreadByClient => integer().withDefault(const Constant(0))();
  DateTimeColumn get updatedAt   => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('ChatMessageEntity')
class ChatMessagesTable extends Table {
  TextColumn get id         => text()();
  TextColumn get roomId     => text().references(ChatRoomsTable, #id)();
  TextColumn get senderId   => text()();
  TextColumn get senderRole => text()(); // 'client' | 'staff' | 'admin'
  TextColumn get type       => text()(); // 'text' | 'image' | 'product_card' | 'animal_card'
  
  TextColumn get content    => text().nullable()();
  TextColumn get imageLocalPath  => text().nullable()();
  TextColumn get imageRemoteUrl  => text().nullable()();
  TextColumn get cardPayload     => text().nullable()(); // JSON Snapshot
  
  BoolColumn get isRead     => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt   => dateTime()();
  
  // Metadatos Offline-First
  TextColumn get syncStatus  => text().withDefault(const Constant('pending'))(); // 'pending' | 'uploading_media' | 'synced'

  @override
  Set<Column> get primaryKey => {id};
}
