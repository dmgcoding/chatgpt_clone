import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:gpt_clone1/environment.dart';
import 'package:gpt_clone1/models/msg.dart';
import 'package:gpt_clone1/utils/asset_paths.dart';
import 'package:gpt_clone1/utils/colors.dart';
import 'package:gpt_clone1/utils/enums.dart';
import 'package:gpt_clone1/widgets/message_bubble.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _msgCtrl = TextEditingController();

  final messages = <Message>[];

  void send() async {
    final request = _msgCtrl.text;
    if (request.trim().isEmpty) return;
    messages.add(Message(MessageAuthor.user, request));
    _msgCtrl.clear();
    setState(() {});

    try {
      final messageRequests = [
        OpenAIChatCompletionChoiceMessageModel(
          role: OpenAIChatMessageRole.user,
          content: [
            OpenAIChatCompletionChoiceMessageContentItemModel.text(request),
          ],
        ),
      ];
      final msg = await OpenAI.instance.chat.create(
        model: openaimodel,
        messages: messageRequests,
        n: 1,
      );
      final contents = msg.choices.first.message.content ?? [];
      if (contents.isEmpty) return;
      final response = contents.first.text ?? 'error';
      messages.add(Message(MessageAuthor.chatgpt, response));
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ChatGpt')),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.7,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: messages.length,
                itemBuilder: (cxt, i) {
                  final msg = messages[i];
                  return MessageBubble(author: msg.author, text: msg.message);
                },
              ),
            ),
            const Spacer(),
            Center(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(AssetPaths.regen, width: 16),
                      const SizedBox(width: 12),
                      const Text('Regenerate response'),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _msgCtrl,
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.green),
                ),
                suffixIcon: GestureDetector(
                  onTap: send,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(top: 4, bottom: 4, right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: AppColors.green,
                    ),
                    child: Image.asset(AssetPaths.send, width: 20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
