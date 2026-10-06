
import 'package:flutter/material.dart';

class Action {
  String name; // this would be showed
  VoidCallbackAction action;

  Action({
    required this.name,
    required this.action
  });
}