// Test de humo: verifica que ChatTagsWidget renderiza un Wrap con un Chip
// por cada etiqueta recibida.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:clonacion_app/core/theme/app_theme.dart';
import 'package:clonacion_app/features/chat/presentation/widgets/chat_tags_widget.dart';

void main() {
  testWidgets('ChatTagsWidget muestra un Chip por cada etiqueta en un Wrap', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.theme,
        home: const Scaffold(
          body: ChatTagsWidget(tags: <String>['Trabajo', 'Familia', 'Urgente']),
        ),
      ),
    );

    expect(find.byType(Wrap), findsOneWidget);
    expect(find.byType(Chip), findsNWidgets(3));
    expect(find.text('Trabajo'), findsOneWidget);
    expect(find.text('Urgente'), findsOneWidget);
  });
}
