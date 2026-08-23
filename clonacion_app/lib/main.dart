import 'package:flutter/material.dart';

import 'core/constants/app_strings.dart';
import 'core/theme/app_theme.dart';
import 'features/chat/presentation/pages/chat_list_page.dart';

void main() {
  runApp(const TelegramCloneApp());
}

/// Punto de entrada de la app. Solo registra la pantalla de lista de
/// chats: no existen otras rutas.
class TelegramCloneApp extends StatelessWidget {
  const TelegramCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const ChatListPage(),
    );
  }
}
