import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:give_me_a_kiss/src/domain/entities/action.dart' as domain;
import 'package:give_me_a_kiss/src/domain/entities/message.dart';
import 'package:give_me_a_kiss/src/presentation/providers/stats_provider.dart';

class ChatProvider extends ChangeNotifier {
  late final List<Message> messages;
  StatsProvider stats;
  final ScrollController controller = ScrollController();
  int result = 0;
  bool canAnswer = false;

  ChatProvider(this.stats) {
    messages = [
      Message(
        text: 'Hola amor!, te amo, que quieres hacer?',
        who: Who.kisser,
        actions: [
          domain.Action(name: 'Jugar', action: play),
          domain.Action(name: 'Cobrar', action: withdrawl),
        ],
      ),
    ];
  }

  void play() async {
    canAnswer = false;
    messages.add(Message(text: 'Jugar', who: Who.fan));
    await moveToBottom();

    if (stats.canPlay()) {
      stats.play();

      await Future.delayed(Duration(milliseconds: 500));

      int n1 = Random().nextInt(10);
      int n2 = Random().nextInt(10);
      result = n1 + n2;

      messages.add(Message(text: 'Cuanto es $n1 + $n2?', who: Who.kisser));
      canAnswer = true;
      await moveToBottom();
    } else {
      messages.add(
        Message(
          text: 'No tienes oportunidades disponibles, vuelve maniana 😭',
          who: Who.kisser,
          actions: [
            domain.Action(name: 'Cobrar', action: withdrawl),
            domain.Action(name: 'Salir', action: SystemNavigator.pop),
          ],
        ),
      );
      await moveToBottom();
    }
  }

  void withdrawl() async {
    messages.add(Message(text: 'Cobrar', who: Who.fan));
    await moveToBottom();

    await Future.delayed(Duration(milliseconds: 500));

    if (stats.canGetKiss()) {
      stats.withdrawl();
      messages.add(
        Message(
          text: 'Descontando de tu saldo! 🤢',
          who: Who.kisser,
          actions: [
            domain.Action(name: 'Jugar', action: play),
            domain.Action(name: 'Cobrar', action: withdrawl),
          ],
        ),
      );
    } else {
      messages.add(
        Message(
          text: 'Ponete a chambear vos! 🙄',
          who: Who.kisser,
          actions: [domain.Action(name: 'Jugar', action: play)],
        ),
      );
    }

    await moveToBottom();
  }

  void receiveAnswer(int value) async {
    if (!canAnswer) return;

    canAnswer = false;
    messages.add(Message(text: '$value', who: Who.fan));
    await moveToBottom();

    await Future.delayed(Duration(milliseconds: 500));

    if (value == result) {
      stats.win();
      messages.add(
        Message(
          text: 'MILAGRO!',
          who: Who.kisser,
          actions: [
            domain.Action(name: 'Cobrar', action: withdrawl),
            domain.Action(name: 'Volver a Jugar', action: play),
          ],
        ),
      );
      moveToBottom();
    } else {
      messages.add(
        Message(
          text: 'Lo siento amorcito, las mates no son lo tuyo! 😢',
          who: Who.kisser,
          actions: [
            domain.Action(name: 'Volver a Jugar', action: play),
            domain.Action(name: 'retirarte', action: null),
          ],
        ),
      );
      stats.loss();
      moveToBottom();
    }
  }

  Future<void> moveToBottom() async {
    notifyListeners();

    await WidgetsBinding.instance.endOfFrame;

    if (!controller.hasClients || !controller.position.hasContentDimensions) {
      return;
    }
    controller.animateTo(
      controller.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
