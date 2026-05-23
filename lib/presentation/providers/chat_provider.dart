import 'package:flutter/material.dart';
import 'package:yes_is_my_app/domain/entities/message.dart';
import '../../config/helpers/get_yes_no_answer.dart';

class ChatProvider extends ChangeNotifier {
  final chatScrollController = ScrollController();

  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Hola amor! Como estas?', fromWho: FromWho.me),
    Message(text: 'Ya estas en casa?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);

    messageList.add(newMessage);

    notifyListeners();

    moveScrollToBottom();

    if (text.endsWith('?')) {
      await herReply();
    }
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();

    messageList.add(herMessage);

    notifyListeners();

    moveScrollToBottom();
  }

  void moveScrollToBottom() {
    if (!chatScrollController.hasClients) return;

    Future.delayed(const Duration(milliseconds: 100), () {
      chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }
}
