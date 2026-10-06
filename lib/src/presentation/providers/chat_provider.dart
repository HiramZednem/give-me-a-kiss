
import 'package:flutter/material.dart';
import 'package:give_me_a_kiss/src/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messages = [
    Message(text: 'Hola', who: Who.me),
    Message(text: 'estoy', who: Who.me),
    Message(text: 'probando', who: Who.me),
    Message(text: 'esto', who: Who.me),
  ];

}