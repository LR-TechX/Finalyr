import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';
import '../models/chat_message.dart';
import 'knowledge_base_service.dart';
import 'memory_service.dart';

class ChatService {
  final KnowledgeBaseService knowledgeBase;
  final MemoryService memory;
  final _dio = Dio();
  final _uuid = const Uuid();

  ChatService({required this.knowledgeBase, required this.memory});

  Future<ChatMessage> replyTo(String userInput) async {
    // 1) Check local knowledge base
    final kb = knowledgeBase.findAnswer(userInput);
    if (kb != null) {
      return ChatMessage.bot(_uuid.v4(), kb);
    }

    // 2) Check memory
    final mem = memory.getFromMemory(userInput);
    if (mem != null) {
      return ChatMessage.bot(_uuid.v4(), mem);
    }

    // 3) Fallback: echo / placeholder (replace with your model/backend call)
    final content = "I don't have that in my knowledge base yet, but I'm learning. You asked: \"$userInput\"";
    await memory.addUnanswered(userInput);
    return ChatMessage.bot(_uuid.v4(), content);
  }
}
