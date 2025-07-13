import 'package:flutter/material.dart';
import 'package:gpt_clone1/utils/asset_paths.dart';
import 'package:gpt_clone1/utils/colors.dart';
import 'package:gpt_clone1/utils/enums.dart';
import 'package:gpt_clone1/widgets/message_bubble.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ChatGpt')),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const MessageBubble(
              author: MessageAuthor.me,
              text: 'How to configure lints?',
            ),
            const MessageBubble(
              author: MessageAuthor.chatgpt,
              text:
                  'To enforce the use of the const keyword in your Flutter app using lints, you can configure your analysis_options.yaml file.',
            ),
            const MessageBubble(
              author: MessageAuthor.me,
              text: 'How to configure lints?',
            ),
            const MessageBubble(
              author: MessageAuthor.chatgpt,
              text:
                  'To enforce the use of the const keyword in your Flutter app using lints, you can configure your analysis_options.yaml file.',
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
