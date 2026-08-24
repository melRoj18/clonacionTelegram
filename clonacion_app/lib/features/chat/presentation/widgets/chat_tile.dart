import 'package:flutter/material.dart';

import '../../../../core/constants/app_space.dart';
import '../../../../shared/widgets/avatar_widget.dart';
import '../../domain/chat.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({super.key, required this.chat, this.onTap});

  final Chat chat;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool hasUnread = chat.unread > 0;

    return InkWell(
      onTap: onTap, // Estático: sin efecto cuando no se provee callback.
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpace.md,
          vertical: AppSpace.sm,
        ),
        decoration: BoxDecoration(
          // Separación muy sutil entre chats, sin líneas gruesas ni tarjetas.
          border: Border(
            bottom: BorderSide(
              color: theme.colorScheme.outlineVariant,
              width: AppSpace.dividerWidth,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AvatarWidget(
              imageUrl: chat.avatar,
              fallbackText: chat.name,
              size: AppSpace.avatarLarge,
            ),
            const SizedBox(width: AppSpace.md),
            _ChatInfo(name: chat.name, lastMessage: chat.lastMessage),
            const SizedBox(width: AppSpace.sm),
            SizedBox(
              width: AppSpace.chatTrailingBox,
              height: AppSpace.chatTrailingBox,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  _ChatTime(time: chat.time, hasUnread: hasUnread),
                  if (hasUnread)
                    _BadgeCounter(count: chat.unread)
                  else
                    const SizedBox(height: AppSpace.badgeMinWidth),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Nombre + último mensaje. Extraído para mantener `ChatTile.build` corto
/// y reutilizar el mismo bloque si la fila cambia de layout.
class _ChatInfo extends StatelessWidget {
  const _ChatInfo({required this.name, required this.lastMessage});

  final String name;
  final String lastMessage;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
          Text(
            lastMessage,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

/// Hora del último mensaje, en azul cuando el chat tiene no leídos.
class _ChatTime extends StatelessWidget {
  const _ChatTime({required this.time, required this.hasUnread});

  final String time;
  final bool hasUnread;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Text(
      time,
      style: theme.textTheme.bodySmall?.copyWith(
        color: hasUnread
            ? theme.colorScheme.primary
            : theme.colorScheme.onSurfaceVariant,
        height: 1.0,
      ),
    );
  }
}

/// Badge de mensajes no leídos: círculo para un dígito y "pill" para 2+
/// cifras (p. ej. "28"), igual que el badge de Telegram.
class _BadgeCounter extends StatelessWidget {
  const _BadgeCounter({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpace.badgePaddingH,
        vertical: AppSpace.xs,
      ),
      constraints: const BoxConstraints(minWidth: AppSpace.badgeMinWidth),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSpace.badgeRadius),
        ),
      ),
      child: Text(
        count.toString(),
        textAlign: TextAlign.center,
        style: theme.textTheme.labelMedium?.copyWith(
          color: theme.colorScheme.onPrimary,
          height: 1.0,
        ),
      ),
    );
  }
}
