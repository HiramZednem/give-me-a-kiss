import 'package:flutter/material.dart';
import 'package:give_me_a_kiss/src/presentation/providers/chat_provider.dart';
import 'package:give_me_a_kiss/src/presentation/widgets/kiss/message_bubble.dart';
import 'package:provider/provider.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final messageProvider = context.watch<ChatProvider>();

    return Container(
      child: ListView.builder(
        controller: messageProvider.controller,
        itemCount: messageProvider.messages.length,
        itemBuilder: (context, i) {
          return MessageBubble(message: messageProvider.messages[i]);
        },
      ),
    );
  }
}
