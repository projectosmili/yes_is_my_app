import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String>
  onValue; // es una función que se ejecutará cuando el valor del campo de texto cambie. Se espera que esta función tome un argumento, que será el nuevo valor del campo de texto.

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textControll = TextEditingController(); // e
    final focusNode =
        FocusNode(); // es un elmeno que nos va adar control al imput qe se va asociar.
    // ignore: non_constant_identifier_names
    final outlineInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(20),
    );

    final inputDecoration = InputDecoration(
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      hintText: 'End your message with a "?"',
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textControll.text;
          onValue(
            textValue,
          ); // Llama a la función onValue con el nuevo valor del campo de texto
          textControll
              .clear(); // Limpia el campo de texto después de enviar el mensaje
        },
      ),
    );
    return TextFormField(
      onTapOutside: (event) {
        focusNode
            .unfocus(); // Permite que el campo de texto pierda el foco al tocar fuera de él
      }, // Permite que el campo de texto pierda el foco al tocar fuera de él
      focusNode: focusNode,
      controller: textControll,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        onValue(
          value,
        ); // Llama a la función onValue con el nuevo valor del campo de texto
        textControll.clear();
        focusNode
            .requestFocus(); // Limpia el campo de texto después de enviar el mensaje
      },
      onChanged: (value) {},
    );
  }
}
