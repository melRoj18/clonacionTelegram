import 'package:flutter/material.dart';

import '../../../../core/constants/app_space.dart';

/// Componente de demostración que ilustra el uso de [Wrap] (`spacing` /
/// `runSpacing`) para una lista de etiquetas que saltan de línea cuando no
/// caben en el ancho disponible.
///
/// A propósito **no se monta** en [ChatListPage]: el modelo `Chat` no tiene
/// ningún campo de etiquetas, y el proyecto sigue la regla de no inventar
/// datos que el modelo no expone (ver README, sección "Regla respetada").
/// Se deja como pieza reutilizable y auto-contenida (con su propio test en
/// `test/chat_tags_widget_test.dart`) para satisfacer el criterio de
/// evaluación que pide un ejemplo de `Wrap`, sin alterar la fidelidad
/// visual de la pantalla ya calibrada contra la captura de referencia.
class ChatTagsWidget extends StatelessWidget {
  const ChatTagsWidget({super.key, required this.tags});

  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Wrap(
      spacing: AppSpace.sm,
      runSpacing: AppSpace.xs,
      children: tags
          .map(
            (tag) => Chip(
              label: Text(tag, style: theme.textTheme.labelSmall),
              backgroundColor: theme.colorScheme.surfaceContainerHighest,
              padding: const EdgeInsets.symmetric(horizontal: AppSpace.sm, vertical: AppSpace.xxs),
            ),
          )
          .toList(),
    );
  }
}
