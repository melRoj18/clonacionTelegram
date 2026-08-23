/// Modelo inmutable de un chat mostrado en la lista.
class Chat {
  const Chat({
    required this.id,
    required this.name,
    required this.lastMessage,
    required this.time,
    this.unread = 0,
    this.avatar,
  });

  final String id;
  final String name;
  final String lastMessage;
  final String time;
  final int unread;
  final String? avatar;

  /// Devuelve una tupla con los datos más relevantes del chat.
  /// Ejemplo de uso de Records de Dart 3.
  (String name, String lastMessage, int unread) get summary {
    return (name, lastMessage, unread);
  }
}
