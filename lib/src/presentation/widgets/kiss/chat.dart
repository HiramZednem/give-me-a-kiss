import 'package:flutter/material.dart';
import 'package:give_me_a_kiss/src/presentation/providers/chat_provider.dart';
import 'package:give_me_a_kiss/src/presentation/widgets/kiss/message_bubble.dart';
import 'package:provider/provider.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    final messageProvider = context.watch<ChatProvider>();

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
      controller: messageProvider.controller,
      itemCount: messageProvider.messages.length,
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: MessageBubble(message: messageProvider.messages[i]),
        );
      },
    );
  }
}
