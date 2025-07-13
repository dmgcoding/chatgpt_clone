import 'package:flutter/material.dart';
import 'package:gpt_clone1/pages/get_started.dart';

void main() {
  runApp(const ChatGptClone());
}

class ChatGptClone extends StatelessWidget {
  const ChatGptClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: const GetStartedPage(),
    );
  }
}
