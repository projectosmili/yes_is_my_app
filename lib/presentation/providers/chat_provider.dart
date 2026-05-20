import 'package:flutter/material.dart';
import 'package:yes_is_my_app/models/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> message = [
    Message(text: 'Hola amor! Como estas?', fromWho: FromWho.me),
    Message(text: 'Ya estas en casa?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    final newMessage = Message(text: text, fromWho: FromWho.me);
    message.add(newMessage);
    notifyListeners(); // notifica a los widgets que dependen de este provider que el estado ha cambiado y deben reconstruirse para reflejar los cambios.
  }

  // ChangeNotifier es una clase que proporciona una forma de notificar a los widgets que dependen de ella cuando hay cambios en su estado. Al extender ChangeNotifier, la clase ChatProvider puede llamar al método notifyListeners() para informar a los widgets que deben reconstruirse cuando el estado cambie.
}
