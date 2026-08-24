class AppSpace {
  const AppSpace._();

  // --- Escala base (múltiplos de 4px) ---
  static const double none = 0;
  static const double xxs = 2.0;
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;

  // --- Tamaños de ícono ---
  static const double iconSizeSmall = 22.0; // ícono de búsqueda, ítems del nav
  static const double iconSizeMedium = 26.0; // botón "⋮" del encabezado
  static const double iconSizeLarge = 28.0; // ícono "+" del FAB

  // --- Tamaños de componentes reutilizables ---
  static const double avatarTiny = 22.0; // avatares del encabezado y "Perfil"
  static const double avatarLarge = 58.0; // avatar de cada ChatTile
  static const double fabSize = 60.0; // botón "+" flotante
  static const double searchBarHeight = 56.0; // alto del buscador en píldora
  static const double chatTrailingBox =
      50.0; // caja fija hora+badge (evita overflow)
  static const double bottomNavClearance =
      96.0; // espacio bajo la lista para la barra flotante
  static const double navBarSideMargin =
      20.0; // margen lateral de la barra flotante

  // --- Ajustes finos específicos de esta pantalla ---
  static const double avatarOverlap =
      12.0; // superposición del grupo de avatares
  static const double avatarRingWidth =
      1.5; // grosor del anillo azul del avatar
  static const double dividerWidth = 0.5; // línea sutil entre chats
  static const double looseGap =
      10.0; // hueco ícono/avatar → texto (header y buscador)
  static const double navBarPaddingH =
      6.0; // padding horizontal de la barra flotante
  static const double navItemPaddingH =
      14.0; // padding horizontal de cada ítem del nav
  static const double navItemRadius =
      20.0; // radio de selección de cada ítem del nav
  static const double navIconBoxWidth = 24.0; // caja del ícono+badge en el nav
  static const double navIconBoxHeight = 22.0; // caja del ícono+badge en el nav
  static const double navLabelGap = 3.0; // separación ícono-label en el nav
  static const double navMiniBadgeOffsetX =
      -8.0; // offset del mini-badge del nav
  static const double navMiniBadgeOffsetY =
      -4.0; // offset del mini-badge del nav
  static const double badgePaddingH =
      7.0; // padding horizontal del badge de no leídos
  static const double badgeMinWidth =
      22.0; // ancho mínimo del badge (círculo/píldora)
  static const double badgeRadius = 12.0; // radio del badge de no leídos
  static const double miniBadgeMinWidth =
      16.0; // ancho mínimo del mini-badge del nav
  static const double miniBadgePaddingV =
      1.0; // padding vertical del mini-badge
}
