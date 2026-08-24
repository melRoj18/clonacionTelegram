# Clon de Telegram - Pantalla de Chats

Clon estático de la pantalla principal de chats de Telegram, desarrollado en Flutter como proyecto académico.

## Demo en Vivo

[Ver aplicación desplegada](https://melroj18.github.io/clonacionTelegram/)

## Comparación Visual

| Original (Telegram)                | Clon                            |
| ---------------------------------- | ------------------------------- |
| ![Original](OriginalTelegram.jpeg) | ![Clon](clonacionTelegram.jpeg) |

## Widgets Utilizados

- Row / Column
- Stack + Positioned
- Expanded / Flexible
- Wrap
- CustomScrollView + SliverList

## Ejecutar Localmente

```bash
flutter pub get
flutter run -d chrome
```

## Checklist de evaluación

- [x] Row, Column, Stack + Positioned, Expanded, Flexible, Wrap
- [x] `CustomScrollView` + `SliverList` + `SliverToBoxAdapter`
- [x] `ValueKey` en cada `ChatTile`
- [x] Escala de espaciado de 4px (`AppSpace`), sin números sueltos en los widgets
- [x] `Theme.of(context)` — `colorScheme` y `textTheme` en toda la UI
- [x] Widgets extraídos, builds cortos
- [x] `const` donde corresponde
- [x] `flutter analyze` sin issues
- [x] Capturas de comparación (original + clon)
- [x] Desplegado en GitHub Pages
- [ ] Superposición al 50% de opacidad de ambas capturas (pendiente)
