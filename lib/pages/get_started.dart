import 'package:flutter/material.dart';
import 'package:gpt_clone1/pages/home.dart';
import 'package:gpt_clone1/utils/asset_paths.dart';
import 'package:gpt_clone1/utils/colors.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 50),
          Center(child: Image.asset(AssetPaths.logo, width: 35)),
          const SizedBox(height: 20),
          Center(
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.6,
              child: const Text(
                'Welcome to ChatGPT',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'Ask anything, Get your answer',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 40),
          Center(child: Image.asset(AssetPaths.caution, width: 25)),
          const Center(
            child: Text(
              'Limitations',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 50),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: Center(
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.85,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'May Occationally generate incorrect information',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: Center(
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.85,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'May Occationally produce harmful instructions or biased content',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: Center(
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.85,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Limited knowledge of world and events after 2021',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          const SizedBox(height: 80),
          Center(
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (cxt) => const HomePage()),
              ),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.85,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Let's chat"),
                    const SizedBox(width: 12),
                    Image.asset(AssetPaths.send, width: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
