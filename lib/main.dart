import 'package:flutter/material.dart';
import 'package:yes_is_my_app/config/theme/app_theme.dart';
import 'package:yes_is_my_app/presentation/screen/chat/_chat._screen.dart';

void main() => runApp(
  const MyApp(),
); //constante es algo que no va a cambiar, es inmutable.

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //build es un metodo que se ejecuta cada vez que el widget necesita ser redibujado, es decir, cada vez que hay un cambio en el estado del widget o en sus dependencias. El metodo build recibe un contexto como parametro, el cual es un objeto que contiene informacion sobre la ubicacion del widget en el arbol de widgets y permite acceder a otros widgets y recursos.
    return MaterialApp(
      title: 'Yes, is my app',
      debugShowCheckedModeBanner: false,
      theme: AppTheme(
        selectedColor: 4,
      ).theme(), //serefire como queremos que luzca, los textos, los estilos a difernetes textos, etc
      home: const ChatScreen(),
    );
  }
}
