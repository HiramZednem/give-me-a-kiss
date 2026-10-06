
import 'package:flutter/material.dart';
import 'package:give_me_a_kiss/src/domain/entities/action.dart' as domain;
import 'package:give_me_a_kiss/src/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messages = [
    Message(text: 'Hola', who: Who.kisser, actions: [
      domain.Action(name: 'Jugar', action: null),
      domain.Action(name: 'Cobrar', action: null),
    ]),
    Message(text: 'Jugar', who: Who.fan),
  ];

}