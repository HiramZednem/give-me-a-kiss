import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:give_me_a_kiss/src/presentation/providers/chat_provider.dart';
import 'package:provider/provider.dart';

class Input extends StatefulWidget {
  const Input({super.key});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void _submitAnswer() {
    final chatProvider = context.read<ChatProvider>();
    if (!chatProvider.canAnswer) return;

    final value = int.tryParse(controller.text);
    if (value == null) return;

    chatProvider.receiveAnswer(value);
    controller.clear();
    focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final canAnswer = context.watch<ChatProvider>().canAnswer;

    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      enabled: canAnswer,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.send,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      onFieldSubmitted: (_) => _submitAnswer(),
      decoration: InputDecoration(
        hintText: canAnswer
            ? 'Escribe tu respuesta...'
            : 'Presiona "Jugar" para comenzar',
        prefixIcon: const Icon(Icons.edit_rounded),
        suffixIcon: IconButton(
          tooltip: 'Enviar respuesta',
          onPressed: canAnswer ? _submitAnswer : null,
          icon: const Icon(Icons.send_rounded),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: const BorderSide(color: Color(0xFFFFE082)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: const BorderSide(color: Color(0xFFE5A900), width: 1.5),
        ),
      ),
    );
  }
}
