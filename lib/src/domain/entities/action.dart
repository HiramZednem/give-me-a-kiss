
import 'package:flutter/material.dart';

class Action {
  String name; // this would be showed
  VoidCallback? action;

  Action({
    required this.name,
    this.action
  });
}