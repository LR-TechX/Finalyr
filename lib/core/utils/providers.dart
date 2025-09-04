import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/chat_message.dart';
import '../models/settings_model.dart';
import '../services/chat_service.dart';
import '../services/knowledge_base_service.dart';
import '../services/memory_service.dart';

final settingsProvider = StateProvider<AppSettings>((ref) => AppSettings.defaults);

final chatHistoryProvider = StateNotifierProvider<ChatHistoryNotifier, List<ChatMessage>>(
  (ref) => ChatHistoryNotifier(),
);

final chatServiceProvider = Provider<ChatService>((ref) {
  return ChatService(
    knowledgeBase: KnowledgeBaseService.instance,
    memory: MemoryService.instance,
  );
});

class ChatHistoryNotifier extends StateNotifier<List<ChatMessage>> {
  ChatHistoryNotifier() : super(const []);

  void add(ChatMessage msg) => state = [...state, msg];
  void clear() => state = const [];
}
