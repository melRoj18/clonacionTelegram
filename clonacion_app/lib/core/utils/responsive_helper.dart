import 'package:flutter/material.dart';

/// [maxPhoneWidth]
class ResponsiveHelper {
  const ResponsiveHelper._();

  /// Ancho máximo considerado "teléfono".
  static const double maxPhoneWidth = 480.0;

  static bool isPhone(BuildContext context) {
    return MediaQuery.of(context).size.width <= maxPhoneWidth;
  }

  static double getResponsiveSize(BuildContext context, double size) {
    final double width = MediaQuery.of(context).size.width;
    if (width <= 380) return size * 0.8;
    if (width <= maxPhoneWidth) return size * 0.9;
    return size;
  }
}
