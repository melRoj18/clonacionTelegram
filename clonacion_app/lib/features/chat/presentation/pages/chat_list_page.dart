import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/constants/app_space.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../data/chat_repository.dart';
import '../../domain/chat.dart';
import '../state/chat_list_state.dart';
import '../widgets/chat_header.dart';
import '../widgets/chat_tile.dart';
import '../widgets/floating_add_button.dart';
import '../widgets/navigation_bottom_bar.dart';
import '../widgets/search_bar_widget.dart';

/// Única pantalla de la aplicación: la lista de chats.
///
/// Toda la interacción es estática (ver [ChatHeader], [SearchBarWidget],
/// [FloatingAddButton] y [NavigationBottomBar]); esta página solo se
/// encarga de simular la carga asíncrona de los chats mock y de
/// renderizarlos en un [CustomScrollView] (ver [_ChatListBody]).
class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  late final ChatRepository _repository;
  late final Future<List<Chat>> _chatsFuture;

  @override
  void initState() {
    super.initState();
    _repository = ChatRepository();
    _chatsFuture = _repository.loadChats();
  }

  @override
  void dispose() {
    _repository.dispose();
    super.dispose();
  }

  ChatListState _stateFromSnapshot(AsyncSnapshot<List<Chat>> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const ChatListLoading();
    }
    if (snapshot.hasError) {
      return ChatListError(snapshot.error.toString());
    }
    return ChatListLoaded(snapshot.data ?? const <Chat>[]);
  }

  @override
  Widget build(BuildContext context) {
    // Fondo blanco ⇒ iconos oscuros en la barra de estado del sistema.
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: ResponsiveHelper.maxPhoneWidth),
          child: Scaffold(
            body: SafeArea(
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const ChatHeader(),
                      const SearchBarWidget(),
                      Expanded(
                        child: FutureBuilder<List<Chat>>(
                          future: _chatsFuture,
                          builder: (context, snapshot) {
                            final ChatListState state = _stateFromSnapshot(snapshot);
                            return switch (state) {
                              ChatListLoading() => const Center(child: CircularProgressIndicator()),
                              ChatListError(:final message) => Center(
                                  child: Text(
                                    '${AppStrings.errorLoadingChats}\n$message',
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              ChatListLoaded(:final chats) => _ChatListBody(chats: chats),
                            };
                          },
                        ),
                      ),
                    ],
                  ),
                  const Positioned(
                    right: AppSpace.md,
                    bottom: AppSpace.bottomNavClearance,
                    child: FloatingAddButton(),
                  ),
                  const Positioned(
                    left: AppSpace.navBarSideMargin,
                    right: AppSpace.navBarSideMargin,
                    bottom: AppSpace.md,
                    child: NavigationBottomBar(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Cuerpo de la lista de chats: un [CustomScrollView] con la lista en un
/// [SliverList] y un espaciador final para que el último chat no quede
/// oculto tras la barra flotante ni el botón "+".
///
/// Extraído de [ChatListPage.build] para mantener ese `build` por debajo
/// de las ~60 líneas.
class _ChatListBody extends StatelessWidget {
  const _ChatListBody({required this.chats});

  final List<Chat> chats;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => ChatTile(
              key: ValueKey<String>(chats[index].id),
              chat: chats[index],
            ),
            childCount: chats.length,
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: AppSpace.bottomNavClearance)),
      ],
    );
  }
}
