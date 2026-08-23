// Test de humo: verifica que la pantalla de chats se renderiza,
// muestra el título "Telegram" y al menos un chat de los datos mock.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:clonacion_app/main.dart';

void main() {
  testWidgets('ChatListPage muestra el título y la lista de chats', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const TelegramCloneApp());

    // Mientras carga (Future.delayed) se muestra un indicador de progreso.
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Se resuelve el Future simulado (500ms) y se reconstruye el árbol.
    await tester.pumpAndSettle();

    expect(find.text('Telegram'), findsOneWidget);
    expect(find.text('Juan Pérez'), findsOneWidget);
    expect(find.byIcon(Icons.chat_bubble), findsOneWidget);
  });
}
