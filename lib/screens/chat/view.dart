import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Next'),
          onPressed: () {
            showBottomSheet(
              backgroundColor: Colors.red,
              context: context,
              builder: (context) => const SizedBox(
                height: 200,
              ),
            );
          },
        ),
      ),
    );
  }
}
