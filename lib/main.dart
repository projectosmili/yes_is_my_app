import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_is_my_app/presentation/providers/chat_provider.dart';
import 'package:yes_is_my_app/presentation/screen/chat/_chat._screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChatProvider(),
      child: MaterialApp(
        title: 'Yes is My App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const ChatScreen(),
      ),
    );
  }
}
