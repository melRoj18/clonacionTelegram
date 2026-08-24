import 'package:flutter/material.dart';

import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_space.dart';

class FloatingAddButton extends StatelessWidget {
  const FloatingAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Material(
      color: theme.colorScheme.primary,
      shape: const CircleBorder(),
      elevation: 3,
      shadowColor: Colors.black38,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: () {}, // Estático: no navega ni crea nada.
        child: SizedBox(
          width: AppSpace.fabSize,
          height: AppSpace.fabSize,
          child: Icon(
            AppIcons.add,
            color: theme.colorScheme.onPrimary,
            size: AppSpace.iconSizeLarge,
          ),
        ),
      ),
    );
  }
}
