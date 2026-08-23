import 'dart:async';

import '../domain/chat.dart';
import 'mock_data.dart';

/// Repositorio que simula el acceso a datos (asíncrono) de los chats.
///
/// No realiza ninguna llamada de red real: solo demuestra el uso de
/// [Future] (carga inicial) y [Stream] (actualizaciones) sobre datos
/// estáticos, ya que la pantalla es puramente visual.
class ChatRepository {
  ChatRepository();

  final StreamController<List<Chat>> _controller =
      StreamController<List<Chat>>.broadcast();

  /// Stream de actualizaciones de la lista de chats.
  Stream<List<Chat>> get chatStream => _controller.stream;

  /// Simula una carga remota de los chats.
  Future<List<Chat>> loadChats() async {
    await Future.delayed(const Duration(milliseconds: 500));
    final List<Chat> chats = MockData.chats;
    _controller.add(chats);
    return chats;
  }

  void dispose() {
    _controller.close();
  }
}
