import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:give_me_a_kiss/src/presentation/providers/chat_provider.dart';
import 'package:give_me_a_kiss/src/presentation/providers/stats_provider.dart';
import 'package:provider/provider.dart';

class Input extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final focusNode = FocusNode();

    final chatProvider = context.read<ChatProvider>();

    // TODO: if play hasn't started, this field should be disabled.
      return TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        controller: controller,
        focusNode: focusNode,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
        onFieldSubmitted: (value) {
          controller.clear();
          chatProvider.receiveAnswer(int.parse(value));
          focusNode.requestFocus();
        },
      );
    }
}
