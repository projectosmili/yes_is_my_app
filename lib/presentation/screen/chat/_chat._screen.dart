import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_is_my_app/domain/entities/message.dart';
import 'package:yes_is_my_app/presentation/providers/chat_provider.dart';
import 'package:yes_is_my_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_is_my_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_is_my_app/presentation/widgets/chat/message_field_box.dart'
    show MessageFieldBox;

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          // es un espacio , leading es un widget que se muestra al principio de la barra de aplicaciones, generalmente se utiliza para mostrar un icono o una imagen de perfil. En este caso, se utiliza un widget Padding para agregar un espacio alrededor del widget CircleAvatar, que muestra una imagen de perfil.
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhgKfjK_t35kbytGuIZ5cl42_0Zuk6aod2EA&s',
            ),
          ),
        ),
        title: const Text('Meu amor'),
        centerTitle: false,
      ),
      body: _ChatView(), //
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];

                  return (message.fromWho == FromWho.hers)
                      ? const HerMessageBubble()
                      : MyMessageBubble(message: message);
                },
              ),
            ),

            ///todo: message field box caja de texto para escribir el mensaje
            MessageFieldBox(
              onValue: chatProvider.sendMessage,
              // onValue              // }
            ),
          ],
        ),
      ),
    );
  }
}
