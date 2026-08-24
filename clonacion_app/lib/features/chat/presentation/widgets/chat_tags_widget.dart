import 'package:flutter/material.dart';

import '../../../../core/constants/app_space.dart';

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
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpace.sm,
                vertical: AppSpace.xxs,
              ),
            ),
          )
          .toList(),
    );
  }
}
