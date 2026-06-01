import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../domain/chat/entities/chat_message.dart';
import '../../../../domain/chat/repositories/chat_repository.dart';
import '../../../../data/chat/chat_repository_impl.dart';
import '../../../../core/providers/database_provider.dart';
import '../../../../data/medical/attachment_service.dart';

// REPOSITORY PROVIDER
final chatRepositoryProvider = Provider<ChatRepository>((ref) {
  return ChatRepositoryImpl(
    FirebaseFirestore.instance,
    ref.watch(appDatabaseProvider),
    ref.watch(attachmentServiceProvider),
  );
});

// PAGINATION PROVIDER
class ChatPaginationNotifier extends Notifier<int> {
  @override
  int build() => 50; // Límite inicial

  void loadMore() {
    state = state + 50; // Incrementar límite de la consulta
  }
}

final chatLimitProvider = NotifierProvider<ChatPaginationNotifier, int>(() {
  return ChatPaginationNotifier();
});

// MESSAGES STREAM PROVIDER
final chatMessagesProvider = StreamProvider.family<List<ChatMessage>, String>((ref, roomId) {
  final limit = ref.watch(chatLimitProvider);
  return ref.watch(chatRepositoryProvider).watchMessages(roomId, limit: limit);
});
