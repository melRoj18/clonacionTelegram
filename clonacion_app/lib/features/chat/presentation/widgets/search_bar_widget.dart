import 'package:flutter/material.dart';

import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_space.dart';
import '../../../../core/constants/app_strings.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      color: theme.colorScheme.surface,
      padding: const EdgeInsets.fromLTRB(
        AppSpace.md,
        AppSpace.xs,
        AppSpace.md,
        AppSpace.looseGap,
      ),
      child: Container(
        height: AppSpace.searchBarHeight,
        padding: const EdgeInsets.symmetric(horizontal: AppSpace.md),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(AppSpace.searchBarHeight / 2),
        ),
        child: Row(
          children: <Widget>[
            Icon(
              AppIcons.search,
              color: theme.colorScheme.onSurfaceVariant,
              size: AppSpace.iconSizeSmall,
            ),
            const SizedBox(width: AppSpace.looseGap),
            // Flexible: si el hint alguna vez fuera más largo que el ancho
            // disponible de la píldora, se recorta con "…" en vez de
            // desbordar el Row (RenderFlex overflow).
            Flexible(
              child: Text(
                AppStrings.searchHint,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
