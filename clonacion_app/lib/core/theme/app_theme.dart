import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

/// Tema global de la aplicación.
///
/// [AppColors] sigue siendo la única fuente de verdad para los valores hex
/// (paleta de Telegram); este archivo los vuelca en un [ColorScheme] y un
/// [TextTheme] para que el resto de los widgets consuman siempre
/// `Theme.of(context)` en vez de referenciar `AppColors`/`TextStyle` sueltos.
class AppTheme {
  const AppTheme._();

  static ThemeData get theme {
    final ColorScheme colorScheme =
        ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.light,
        ).copyWith(
          primary: AppColors.primary,
          onPrimary: AppColors.iconOnPrimary,
          secondary: AppColors.secondary,
          surface: AppColors.background,
          onSurface: AppColors.textPrimary,
          onSurfaceVariant: AppColors.textSecondary,
          surfaceContainerHighest: AppColors.searchBackground,
          primaryContainer: AppColors.selectedNavBackground,
          outlineVariant: AppColors.divider,
          tertiary: AppColors.sentCheck,
        );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      dividerColor: colorScheme.outlineVariant,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        centerTitle: false,
      ),
      splashFactory: NoSplash.splashFactory,

      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 27,
          fontWeight: FontWeight.w600,
        ), // título "Telegram"
        titleMedium: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ), // nombre del chat
        bodyLarge: TextStyle(fontSize: 18), // hint del buscador
        bodyMedium: TextStyle(fontSize: 15), // último mensaje
        bodySmall: TextStyle(fontSize: 13), // hora del chat
        labelMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ), // contador no leídos
        labelSmall: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ), // labels del nav
      ),
    );
  }
}
