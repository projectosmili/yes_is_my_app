import 'package:flutter/material.dart';
import 'package:yes_is_my_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  //instacnias de ScrollController para controlar el desplazamiento de la lista de mensajes en la interfaz de usuario. Esto permite que la aplicación pueda desplazarse automáticamente hacia abajo cuando se agregan nuevos mensajes, asegurando que el usuario siempre vea el mensaje más reciente.

  List<Message> messageList = [
    Message(text: 'Hola amor! Como estas?', fromWho: FromWho.me),
    Message(text: 'Ya estas en casa?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    notifyListeners();
    moveScrollToButtom();
  }
  // notifica a los widgets que dependen de este provider que el estado ha cambiado y deben reconstruirse para reflejar los cambios.

  void moveScrollToButtom() {
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  // ChangeNotifier es una clase que proporciona una forma de notificar a los widgets que dependen de ella cuando hay cambios en su estado. Al extender ChangeNotifier, la clase ChatProvider puede llamar al método notifyListeners() para informar a los widgets que deben reconstruirse cuando el estado cambi
}
