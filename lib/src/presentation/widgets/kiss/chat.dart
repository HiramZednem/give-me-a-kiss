

import 'package:flutter/material.dart';
import 'package:give_me_a_kiss/src/presentation/providers/chat_provider.dart';
import 'package:give_me_a_kiss/src/presentation/widgets/kiss/my_message_bubble.dart';
import 'package:provider/provider.dart';

class Chat extends StatelessWidget {

  Chat();

  @override
  Widget build(BuildContext context) {
    final messageProvider =  context.watch<ChatProvider>();

    return Container(
      child: ListView.builder(
        itemCount: messageProvider.messages.length,
        itemBuilder: (context, i) {
          return MyMessageBubble(text: messageProvider.messages[i].text);
        },
      ),
    );
  }
}