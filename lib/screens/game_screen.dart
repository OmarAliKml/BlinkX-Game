import 'package:blinkx/screens/results_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../shared/controller/game_controller.dart';
import '../shared/core/colors.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GameController()..startGame(),
      child: Consumer<GameController>(
        builder: (context, controller, _) {
          if (controller.isGameOver) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ResultScreen(score: controller.score)));
            });
          }
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Score: ${controller.score}", style: const TextStyle(fontSize: 24)),
                const SizedBox(height: 20),
                Container(
                  height: 200,
                  width: 200,
                  color: controller.currentColor,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: colorList.map((color) {
                    return ElevatedButton(
                      onPressed: () => controller.checkAnswer(color),
                      style: ElevatedButton.styleFrom(backgroundColor: color),
                      child: const Text(""),
                    );
                  }).toList(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
