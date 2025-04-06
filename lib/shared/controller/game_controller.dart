import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../core/colors.dart';

class GameController extends ChangeNotifier {
  Color currentColor = redColor;
  int score = 0;
  int time = 2;
  bool isGameOver = false;
  Timer? timer;

  void startGame() {
    score = 0;
    isGameOver = false;
    time = 2;
    generateRandomColor();
    startTimer();
  }

  void startTimer() {
    timer?.cancel();
    timer = Timer(Duration(seconds: time), () {
      isGameOver = true;
      notifyListeners();
    });
  }

  void generateRandomColor() {
    currentColor = colorList[Random().nextInt(colorList.length)];
    notifyListeners();
  }

  void checkAnswer(Color color) {
    if (color == currentColor) {
      score++;
      time = (time > 1) ? time - 1 : 1;
      generateRandomColor();
      startTimer();
    } else {
      isGameOver = true;
    }
    notifyListeners();
  }

  void stopGame() {
    timer?.cancel();
  }
}
