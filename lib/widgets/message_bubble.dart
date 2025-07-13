import 'package:flutter/material.dart';
import 'package:gpt_clone1/utils/asset_paths.dart';
import 'package:gpt_clone1/utils/colors.dart';
import 'package:gpt_clone1/utils/enums.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({required this.author, required this.text, super.key});
  final MessageAuthor author;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: author == MessageAuthor.me
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(12),
                  topRight: const Radius.circular(12),
                  bottomLeft: author == MessageAuthor.me
                      ? const Radius.circular(12)
                      : const Radius.circular(0),
                  bottomRight: author == MessageAuthor.me
                      ? const Radius.circular(0)
                      : const Radius.circular(12),
                ),
                color: author == MessageAuthor.me
                    ? AppColors.green
                    : AppColors.grey,
              ),
              child: Text(text),
            ),
          ),

          author == MessageAuthor.me
              ? Container()
              : Container(
                  margin: const EdgeInsets.only(left: 8, top: 12, right: 8),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Image.asset(AssetPaths.thumbsUp, width: 18),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.only(top: 6),
                        child: Image.asset(AssetPaths.thumbsDown, width: 18),
                      ),
                      const SizedBox(width: 40),

                      Row(
                        children: [
                          Image.asset(AssetPaths.copy, width: 18),
                          const SizedBox(width: 8),
                          const Text(
                            'Copy',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
