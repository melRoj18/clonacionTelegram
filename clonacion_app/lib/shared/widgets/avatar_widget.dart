import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key,
    required this.size,
    this.imageUrl,
    this.fallbackText,
  });

  final double size;
  final String? imageUrl;
  final String? fallbackText;

  /// Paleta de colores usada por Telegram para los avatares sin foto.
  static const List<Color> _palette = <Color>[
    Color(0xFFE17076), // rojo
    Color(0xFFFAA774), // naranja
    Color(0xFFA695E7), // violeta
    Color(0xFF7BC862), // verde
    Color(0xFF6EC9CB), // turquesa
    Color(0xFF65AADD), // azul
    Color(0xFFEE7AAE), // rosa
  ];

  Color _colorForName(String name) {
    if (name.isEmpty) return _palette.first;
    return _palette[name.hashCode.abs() % _palette.length];
  }

  String _initialsForName(String name) {
    final String trimmed = name.trim();
    if (trimmed.isEmpty) return '?';
    final List<String> parts = trimmed.split(RegExp(r'\s+'));
    if (parts.length >= 2) {
      return (parts[0][0] + parts[1][0]).toUpperCase();
    }
    return trimmed[0].toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final String? url = imageUrl;
    final String name = fallbackText ?? '';

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _colorForName(name),
        image: url != null
            ? DecorationImage(
                image: NetworkImage(url),
                fit: BoxFit.cover,
                // Si la imagen no carga (sin conexión, URL rota, etc.) se
                // ignora el error y se deja ver el color de fondo con las
                // iniciales de [fallbackText] en vez de romper el layout.
                onError: (_, _) {},
              )
            : null,
      ),
      child: url == null && name.isNotEmpty
          ? Center(
              child: Text(
                _initialsForName(name),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size * 0.36,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          : null,
    );
  }
}
