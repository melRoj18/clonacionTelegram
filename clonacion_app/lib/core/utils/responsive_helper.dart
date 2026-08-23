import 'package:flutter/material.dart';

/// Utilidades para un diseño responsive limitado a teléfonos.
///
/// La app está pensada exclusivamente para pantallas de teléfono; en
/// pantallas más anchas (tablet/desktop/web) el contenido se limita a
/// [maxPhoneWidth] y se centra, en vez de reflowear el layout.
class ResponsiveHelper {
  const ResponsiveHelper._();

  /// Ancho máximo considerado "teléfono".
  static const double maxPhoneWidth = 480.0;

  /// Indica si el ancho actual corresponde a un teléfono.
  static bool isPhone(BuildContext context) {
    return MediaQuery.of(context).size.width <= maxPhoneWidth;
  }

  /// Escala un tamaño base según el ancho de pantalla disponible,
  /// para teléfonos pequeños (<=380) y medianos (<=480).
  static double getResponsiveSize(BuildContext context, double size) {
    final double width = MediaQuery.of(context).size.width;
    if (width <= 380) return size * 0.8;
    if (width <= maxPhoneWidth) return size * 0.9;
    return size;
  }
}
