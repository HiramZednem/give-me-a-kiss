

import 'package:flutter/material.dart';
import 'package:give_me_a_kiss/src/domain/entities/message.dart';
import 'package:give_me_a_kiss/src/domain/entities/action.dart' as domain;

class MessageBubble extends StatelessWidget {
  Message message;

  MessageBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final messageColor = (message.who == Who.kisser) ? colors.primary : colors.secondary;
    final messageAlignement = (message.who == Who.kisser) ? CrossAxisAlignment.start : CrossAxisAlignment.end;

    return Column(
      crossAxisAlignment: messageAlignement,
      children: [
        Container(
          decoration: BoxDecoration(
            color: messageColor,
            borderRadius: BorderRadius.circular(25)
          ), 
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(message.text, style: TextStyle(color: Colors.white),),
          )
        ),
            
        SizedBox(height: 5,),

        if (message.actions != null && message.actions!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              spacing: 5,
              children: [
                for (final action in message.actions!)
                  _ChatButton(action)
              ],
            ),
          ),
      ],
    );
  }
}

class _ChatButton extends StatelessWidget {
  domain.Action action;

  _ChatButton(this.action);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: action.action,
      child: Text(action.name),
    );
  }

}