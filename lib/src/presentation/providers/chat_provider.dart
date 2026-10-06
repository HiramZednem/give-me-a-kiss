
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:give_me_a_kiss/src/domain/entities/action.dart' as domain;
import 'package:give_me_a_kiss/src/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  late final List<Message> messages;

  ChatProvider() {
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
    // TODO: add conection with stats_provider to si if user can play

    messages.add(
      Message(text: 'Jugar', who: Who.fan),
    );
    notifyListeners();

    await Future.delayed(Duration(milliseconds: 500));
    // hacer un ejercicio matematico y enviarlo
    int n1 = Random().nextInt(10);
    int n2 = Random().nextInt(10);

    messages.add(
      Message(text: 'Cuanto es $n1 + $n2?', who: Who.kisser)
    );
    notifyListeners();

  }
}