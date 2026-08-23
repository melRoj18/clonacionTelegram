import 'package:flutter/material.dart';

import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_space.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../shared/widgets/avatar_widget.dart';
import '../../data/mock_data.dart';
import '../../domain/chat.dart';

/// Encabezado superior de la pantalla de chats.
///
/// A diferencia de la versión anterior, NO es un [AppBar] azul: es un
/// contenedor blanco con un grupo de avatares (reutilizando fotos de los
/// chats ya existentes en [MockData]), el título "Telegram" en azul y un
/// botón "⋮" puramente visual.
class ChatHeader extends StatelessWidget {
  const ChatHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      color: theme.colorScheme.surface,
      padding: const EdgeInsets.fromLTRB(AppSpace.md, AppSpace.sm, AppSpace.sm, AppSpace.sm),
      child: Row(
        children: <Widget>[
          const _AvatarGroup(),
          const SizedBox(width: AppSpace.looseGap),
          Text(
            AppStrings.appTitle,
            style: theme.textTheme.titleLarge?.copyWith(color: theme.colorScheme.primary),
          ),
          const Spacer(),
          IconButton(
            icon: Icon(AppIcons.moreVert, color: theme.colorScheme.onSurface, size: AppSpace.iconSizeMedium),
            onPressed: () {}, // Estático: no navega.
          ),
        ],
      ),
    );
  }
}

/// Par de avatares superpuestos con un anillo azul, tomados de los dos
/// primeros chats existentes (no se inventan contactos ni imágenes).
class _AvatarGroup extends StatelessWidget {
  const _AvatarGroup();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final List<Chat> chats = MockData.chats;
    final Chat? first = chats.isNotEmpty ? chats[0] : null;
    final Chat? second = chats.length > 1 ? chats[1] : null;

    if (first == null) {
      return const SizedBox(width: AppSpace.avatarTiny, height: AppSpace.avatarTiny);
    }

    return SizedBox(
      width: second != null ? AppSpace.avatarTiny + AppSpace.avatarOverlap : AppSpace.avatarTiny,
      height: AppSpace.avatarTiny,
      child: Stack(
        children: <Widget>[
          if (second != null) Positioned(left: AppSpace.avatarOverlap, child: _ring(theme, second)),
          Positioned(left: 0, child: _ring(theme, first)),
        ],
      ),
    );
  }

  Widget _ring(ThemeData theme, Chat chat) {
    return Container(
      padding: const EdgeInsets.all(AppSpace.avatarRingWidth),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: theme.colorScheme.surface,
        border: Border.fromBorderSide(
          BorderSide(color: theme.colorScheme.primary, width: AppSpace.avatarRingWidth),
        ),
      ),
      child: AvatarWidget(
        imageUrl: chat.avatar,
        fallbackText: chat.name,
        size: AppSpace.avatarTiny,
      ),
    );
  }
}
