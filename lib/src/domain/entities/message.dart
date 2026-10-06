
import 'package:give_me_a_kiss/src/domain/entities/action.dart';

enum Who {
  me, her
}

class Message {
  String text;
  Who who;
  List<Action>? actions;

  Message({
    required this.text,
    required this.who,
    this.actions
  });
}