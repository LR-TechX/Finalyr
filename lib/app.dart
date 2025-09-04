import 'package:flutter/material.dart';
import 'theme/cyber_theme.dart';
import 'features/chat/chat_screen.dart';

class CyberApp extends StatelessWidget {
  const CyberApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CyberAI',
      theme: cyberTheme,
      debugShowCheckedModeBanner: false,
      home: const ChatScreen(),
    );
  }
}
