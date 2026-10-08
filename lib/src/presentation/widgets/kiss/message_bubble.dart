import 'package:flutter/material.dart';
import 'package:give_me_a_kiss/src/domain/entities/action.dart' as domain;
import 'package:give_me_a_kiss/src/domain/entities/message.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isKisser = message.who == Who.kisser;

    return Column(
      crossAxisAlignment:
          isKisser ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.sizeOf(context).width * 0.78,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: isKisser ? const Color(0xFFFFF8E1) : colors.primary,
              border: isKisser
                  ? Border.all(color: const Color(0xFFFFEDB3))
                  : null,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20),
                bottomLeft: Radius.circular(isKisser ? 6 : 20),
                bottomRight: Radius.circular(isKisser ? 20 : 6),
              ),
            ),
            child: Text(
              message.text,
              style: TextStyle(
                color: isKisser ? const Color(0xFF493900) : colors.onPrimary,
                height: 1.35,
              ),
            ),
          ),
        ),
        if (message.actions != null && message.actions!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: _ChatActions(actions: message.actions!),
          ),
      ],
    );
  }
}

class _ChatActions extends StatefulWidget {
  const _ChatActions({required this.actions});

  final List<domain.Action> actions;

  @override
  State<_ChatActions> createState() => _ChatActionsState();
}

class _ChatActionsState extends State<_ChatActions> {
  bool _disabled = false;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final action in widget.actions)
          _ChatButton(
            action,
            disabled: _disabled,
            onPressed: () {
              setState(() => _disabled = true);
              action.action?.call();
            },
          ),
      ],
    );
  }
}

class _ChatButton extends StatelessWidget {
  const _ChatButton(
    this.action, {
    required this.disabled,
    required this.onPressed,
  });

  final domain.Action action;
  final bool disabled;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: disabled || action.action == null ? null : onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color(0xFF755900),
        backgroundColor: const Color(0xFFFFF9E8),
        side: const BorderSide(color: Color(0xFFFFD54F)),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
      child: Text(
        action.name,
        style: const TextStyle(fontWeight: FontWeight.w700),
      ),
    );
  }
}
