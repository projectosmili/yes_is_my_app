import 'package:flutter/material.dart';

import '../../widgets/shared/message_field_box.dart' show MessageFieldBox;

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
      body: ChatView(), //
    );
  }
}

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Text(
                    index % 2 == 0 ? 'Her Message Bubble' : 'My Message bubble',
                  );
                },
              ),
            ),

            ///todo: message field box
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}
