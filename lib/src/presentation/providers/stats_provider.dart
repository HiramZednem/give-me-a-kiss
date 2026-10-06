
import 'package:flutter/material.dart';

class StatsProvider extends ChangeNotifier {
  int opportunities = 3;
  int losses = 0;
  int wins = 0;
  int kisses = 0;

  bool canGetKiss() {
    return kisses != 0;
  }

  bool canPlay() {
    return opportunities != 0;
  }

  void play() {
    if (opportunities == 0) return;
    opportunities--;
    notifyListeners();
  }

  void win() {
    wins++;
    notifyListeners();
  }

  void loss() {
    losses++;
    notifyListeners();
  }
}