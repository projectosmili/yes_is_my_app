import 'package:flutter/material.dart';

class MessageFieldBox extends StatefulWidget {
  const MessageFieldBox({super.key});

  @override
  State<MessageFieldBox> createState() => _MessageFieldBoxState();
}

class _MessageFieldBoxState extends State<MessageFieldBox> {
  final textController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    textController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final outlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(60),
    );

    final inputDecoration = InputDecoration(
      hintText: 'End your message with an emoji ??',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textController.text;
          print('button $textValue');
          textController.clear();
        },
      ),
    );

    return TextFormField(
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,

      onTapOutside: (event) {
        focusNode.unfocus();
      },

      onFieldSubmitted: (value) {
        print('Submit: value $value');
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
