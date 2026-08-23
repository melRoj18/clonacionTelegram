import 'package:flutter/material.dart';

/// Paleta de colores de la aplicación, inspirada en el diseño actual de
/// Telegram: fondo blanco, azul de marca como acento y grises suaves.
class AppColors {
  const AppColors._();

  /// Azul de identidad de Telegram (título, badges, FAB, selección).
  static const Color primary = Color(0xFF229ED9);
  static const Color secondary = Color(0xFF2AABEE);

  static const Color background = Color(0xFFFFFFFF);

  /// Fondo del campo de b
  ///
  /// úsqueda.
  static const Color searchBackground = Color(0xFFF1F1F3);

  /// Fondo del ítem seleccionado en la navegación (azul muy claro).
  static const Color selectedNavBackground = Color(0xFFE3F3FC);

  static const Color textPrimary = Color(0xFF111111);
  static const Color textSecondary = Color(0xFF777777);
  static const Color divider = Color(0xFFF2F2F2);
  static const Color unreadBadge = Color(0xFF229ED9);
  static const Color iconOnPrimary = Color(0xFFFFFFFF);

  /// Verde del check de mensaje enviado (solo si el modelo lo soporta).
  static const Color sentCheck = Color(0xFF45B649);
}
