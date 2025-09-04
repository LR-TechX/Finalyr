import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/chat_message.dart';

class ChatService extends StateNotifier<List<ChatMessage>> {
  ChatService() : super([]);

  void sendMessage(String text, {bool isUser = true}) {
    final newMessage = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: text,
      isUser: isUser,
      timestamp: DateTime.now(),
    );
    state = [...state, newMessage];
  }
}

final chatServiceProvider =
    StateNotifierProvider<ChatService, List<ChatMessage>>((ref) {
  return ChatService();
});
