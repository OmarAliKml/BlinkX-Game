import 'package:blinkx/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BlinkXApp());
}

class BlinkXApp extends StatelessWidget {
  const BlinkXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BlinkX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}
