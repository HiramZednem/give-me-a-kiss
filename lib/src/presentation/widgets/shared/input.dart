
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:give_me_a_kiss/src/presentation/providers/chat_provider.dart';
import 'package:give_me_a_kiss/src/presentation/providers/stats_provider.dart';
import 'package:provider/provider.dart';

class Input extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    final controller = TextEditingController();
    final focusNode = FocusNode();

    final chatProvider = context.read<ChatProvider>();

    return TextFormField(
      keyboardType: TextInputType.number,
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
      onFieldSubmitted: (value) {
        controller.clear();
        chatProvider.receiveAnswer(1);
        focusNode.requestFocus();
      },
    );
  }

}