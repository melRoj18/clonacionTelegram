import '../domain/chat.dart';

/// Datos estáticos (mock) usados para poblar la lista de chats.
class MockData {
  const MockData._();

  static const List<Chat> chats = <Chat>[
    Chat(
      id: '1',
      name: 'Juan Pérez',
      lastMessage: 'Hola, ¿cómo estás?',
      time: '10:30',
      unread: 2,
      avatar: 'https://i.pravatar.cc/150?img=1',
    ),
    Chat(
      id: '2',
      name: 'María García',
      lastMessage: 'Nos vemos mañana',
      time: '09:15',
      avatar: 'https://i.pravatar.cc/150?img=2',
    ),
    Chat(
      id: '3',
      name: 'Pedro López',
      lastMessage: 'Gracias por todo',
      time: '08:45',
      unread: 5,
      avatar: 'https://i.pravatar.cc/150?img=3',
    ),
    Chat(
      id: '4',
      name: 'Ana Martínez',
      lastMessage: 'Perfecto, lo haré',
      time: 'Ayer',
      avatar: 'https://i.pravatar.cc/150?img=4',
    ),
    Chat(
      id: '5',
      name: 'Carlos Rodríguez',
      lastMessage: '¿Puedes ayudarme?',
      time: 'Ayer',
      unread: 1,
      avatar: 'https://i.pravatar.cc/150?img=5',
    ),
    Chat(
      id: '6',
      name: 'Grupo Familia',
      lastMessage: '👍 😊',
      time: 'Ayer',
      unread: 12,
      avatar: 'https://i.pravatar.cc/150?img=6',
    ),
    Chat(
      id: '7',
      name: 'Laura Fernández',
      lastMessage: 'Está bien, te aviso',
      time: 'Ayer',
      avatar: 'https://i.pravatar.cc/150?img=7',
    ),
    Chat(
      id: '8',
      name: 'Grupo Trabajo',
      lastMessage: 'Reunión a las 3 PM',
      time: 'Ayer',
      unread: 8,
      avatar: 'https://i.pravatar.cc/150?img=8',
    ),
    Chat(
      id: '9',
      name: 'Sofía Ramírez',
      lastMessage: '¡Genial!',
      time: 'Ayer',
      avatar: 'https://i.pravatar.cc/150?img=9',
    ),
    Chat(
      id: '10',
      name: 'Diego Torres',
      lastMessage: 'Confirmo asistencia',
      time: 'Ayer',
      unread: 3,
      avatar: 'https://i.pravatar.cc/150?img=10',
    ),
    Chat(
      id: '11',
      name: 'Valentina Cruz',
      lastMessage: 'Nos vemos el viernes',
      time: 'Lun',
      avatar: 'https://i.pravatar.cc/150?img=11',
    ),
    Chat(
      id: '12',
      name: 'Grupo Universidad',
      lastMessage: 'Ya subieron las notas',
      time: 'Lun',
      unread: 20,
      avatar: 'https://i.pravatar.cc/150?img=12',
    ),
  ];
}
