import 'package:flutter/material.dart';

import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_space.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../shared/widgets/avatar_widget.dart';
import '../../data/mock_data.dart';

class NavigationBottomBar extends StatelessWidget {
  const NavigationBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final int unreadTotal = MockData.chats.fold<int>(
      0,
      (sum, chat) => sum + chat.unread,
    );

    return Material(
      color: theme.colorScheme.surface,
      borderRadius: const BorderRadius.all(Radius.circular(AppSpace.xl)),
      elevation: 6,
      shadowColor: Colors.black26,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpace.navBarPaddingH,
          vertical: AppSpace.sm,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _NavItem(
              icon: AppIcons.chat,
              label: AppStrings.navChats,
              isSelected: true,
              badgeCount: unreadTotal,
            ),
            const _NavItem(
              icon: AppIcons.contacts,
              label: AppStrings.navContacts,
              isSelected: false,
            ),
            const _NavItem(
              icon: AppIcons.settings,
              label: AppStrings.navSettings,
              isSelected: false,
            ),
            const _ProfileNavItem(),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    this.badgeCount = 0,
  });

  final IconData icon;
  final String label;
  final bool isSelected;
  final int badgeCount;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color color = isSelected
        ? theme.colorScheme.primary
        : theme.colorScheme.onSurfaceVariant;

    return InkWell(
      onTap: () {}, // Estático: no navega.
      borderRadius: const BorderRadius.all(
        Radius.circular(AppSpace.navItemRadius),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpace.navItemPaddingH,
          vertical: AppSpace.sm,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? theme.colorScheme.primaryContainer
              : Colors.transparent,
          borderRadius: const BorderRadius.all(
            Radius.circular(AppSpace.navItemRadius),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              width: AppSpace.navIconBoxWidth,
              height: AppSpace.navIconBoxHeight,
              child: Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  Icon(icon, color: color, size: AppSpace.iconSizeSmall),
                  if (badgeCount > 0)
                    Positioned(
                      right: AppSpace.navMiniBadgeOffsetX,
                      top: AppSpace.navMiniBadgeOffsetY,
                      child: _MiniBadge(count: badgeCount),
                    ),
                ],
              ),
            ),
            const SizedBox(height: AppSpace.navLabelGap),
            Text(
              label,
              style: theme.textTheme.labelSmall?.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileNavItem extends StatelessWidget {
  const _ProfileNavItem();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return InkWell(
      onTap: () {}, // Estático: no navega.
      borderRadius: const BorderRadius.all(
        Radius.circular(AppSpace.navItemRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpace.navItemPaddingH,
          vertical: AppSpace.sm,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const AvatarWidget(
              size: AppSpace.avatarTiny,
              fallbackText: AppStrings.navProfile,
            ),
            const SizedBox(height: AppSpace.navLabelGap),
            Text(
              AppStrings.navProfile,
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MiniBadge extends StatelessWidget {
  const _MiniBadge({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpace.xs,
        vertical: AppSpace.miniBadgePaddingV,
      ),
      constraints: const BoxConstraints(minWidth: AppSpace.miniBadgeMinWidth),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: const BorderRadius.all(Radius.circular(AppSpace.sm)),
      ),
      child: Text(
        count > 99 ? '99+' : count.toString(),
        textAlign: TextAlign.center,
        style: theme.textTheme.labelSmall?.copyWith(
          color: theme.colorScheme.onPrimary,
          fontSize: 9,
          height: 1.2,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
