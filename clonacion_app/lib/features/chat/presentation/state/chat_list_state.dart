import '../../domain/chat.dart';

/// Estados posibles de la pantalla de lista de chats.
///
/// `sealed class` permite que el `switch` en [chatListStateMessage] sea
/// exhaustivo: el analizador exige cubrir todos los subtipos.
sealed class ChatListState {
  const ChatListState();
}

class ChatListLoading extends ChatListState {
  const ChatListLoading();
}

class ChatListLoaded extends ChatListState {
  const ChatListLoaded(this.chats);
  final List<Chat> chats;
}

class ChatListError extends ChatListState {
  const ChatListError(this.message);
  final String message;
}

/// Ejemplo de patrón/switch exhaustivo sobre [ChatListState].
String chatListStateMessage(ChatListState state) => switch (state) {
      ChatListLoading() => 'Cargando...',
      ChatListLoaded(chats: final chats) => '${chats.length} chats',
      ChatListError(message: final msg) => 'Error: $msg',
    };
