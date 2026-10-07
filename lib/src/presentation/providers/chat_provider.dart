
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:give_me_a_kiss/src/domain/entities/action.dart' as domain;
import 'package:give_me_a_kiss/src/domain/entities/message.dart';
import 'package:give_me_a_kiss/src/presentation/providers/stats_provider.dart';
import 'package:provider/provider.dart';

class ChatProvider extends ChangeNotifier {
  late final List<Message> messages;
  StatsProvider stats;
  ScrollController controller = ScrollController();

  ChatProvider(this.stats) {
    messages = [
      Message(
        text: 'Hola amor!, te amo, que quieres hacer?',
        who: Who.kisser,
        actions: [
          domain.Action(name: 'Jugar', action: play),
          domain.Action(name: 'Cobrar', action: () {}),
        ],
      ),
    ];
  }

  void play() async {
    if (!stats.canPlay()) return;
    stats.play();
    messages.add(
      Message(text: 'Jugar', who: Who.fan),
    );
    await moveToBottom();

    await Future.delayed(Duration(milliseconds: 500));
    // hacer un ejercicio matematico y enviarlo
    int n1 = Random().nextInt(10);
    int n2 = Random().nextInt(10);

    messages.add(
      Message(text: 'Cuanto es $n1 + $n2?', who: Who.kisser)
    );
    await moveToBottom();
  }

  void receiveAnswer(String value) async {
    if(value.isEmpty) return;

    messages.add(
      Message(text: value, who: Who.fan),
    );

    await moveToBottom();
  }

  Future<void> moveToBottom() async {
    notifyListeners();

    await Future.delayed(Duration(milliseconds: 100));

    controller.animateTo(
      controller.position.maxScrollExtent, 
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut
    );
  }
}