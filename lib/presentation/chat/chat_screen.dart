import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../domain/chat/entities/chat_message.dart';
import '../auth/providers/auth_providers.dart';
import 'providers/chat_providers.dart';

class ChatScreen extends ConsumerStatefulWidget {
  final String roomId;
  const ChatScreen({super.key, required this.roomId});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final _scrollController = ScrollController();
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Cargar más mensajes al acercarse al inicio (borde superior del scroll reverso)
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      ref.read(chatLimitProvider.notifier).loadMore();
    }
  }

  Future<void> _sendMessage() async {
    final content = _textController.text.trim();
    if (content.isEmpty) return;
    _textController.clear();

    final user = ref.read(authStateProvider).value;
    if (user == null) return;

    await ref.read(chatRepositoryProvider).sendTextMessage(
          roomId: widget.roomId,
          senderId: user.id,
          senderRole: 'client', // o el rol que corresponda
          content: content,
        );
  }

  Future<void> _sendImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;

    final user = ref.read(authStateProvider).value;
    if (user == null) return;

    await ref.read(chatRepositoryProvider).sendImageOfflineFirst(
          roomId: widget.roomId,
          senderId: user.id,
          senderRole: 'client',
          imageFile: File(pickedFile.path),
        );
  }

  @override
  Widget build(BuildContext context) {
    final messagesAsync = ref.watch(chatMessagesProvider(widget.roomId));
    final currentUserId = ref.watch(authStateProvider).value?.id;

    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: Column(
        children: [
          Expanded(
            child: messagesAsync.when(
              data: (messages) {
                if (messages.isEmpty) {
                  return const Center(child: Text('Aún no hay mensajes.'));
                }
                return ListView.builder(
                  controller: _scrollController,
                  reverse: true, // Scroll invertido
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final msg = messages[index];
                    final isMe = msg.senderId == currentUserId;
                    return _MessageBubble(message: msg, isMe: isMe);
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text('Error: $err')),
            ),
          ),
          _buildInputArea(),
        ],
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      color: Colors.white,
      child: SafeArea(
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.attach_file),
              onPressed: () {
                // TODO: Abrir AttachmentsMenu interactivo
                _sendImage(); 
              },
            ),
            Expanded(
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  hintText: 'Escribe un mensaje...',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                onSubmitted: (_) => _sendMessage(),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send, color: Colors.blue),
              onPressed: _sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  final ChatMessage message;
  final bool isMe;

  const _MessageBubble({required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.all(12),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
        decoration: BoxDecoration(
          color: isMe ? Colors.blue.shade100 : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (message.type == MessageType.text) Text(message.content ?? ''),
            if (message.type == MessageType.image) ...[
              if (message.imageLocalPath != null)
                Image.file(File(message.imageLocalPath!))
              else if (message.imageRemoteUrl != null)
                CachedNetworkImage(
                  imageUrl: message.imageRemoteUrl!,
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
            ],
            const SizedBox(height: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${message.createdAt.hour}:${message.createdAt.minute.toString().padLeft(2, '0')}',
                  style: const TextStyle(fontSize: 10, color: Colors.black54),
                ),
                if (isMe) ...[
                  const SizedBox(width: 4),
                  _buildSyncIcon(message.syncStatus),
                ]
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSyncIcon(SyncStatus status) {
    switch (status) {
      case SyncStatus.pending:
      case SyncStatus.uploadingMedia:
        return const Icon(Icons.access_time, size: 12, color: Colors.black54);
      case SyncStatus.synced:
        return const Icon(Icons.done_all, size: 12, color: Colors.blue);
    }
  }
}
