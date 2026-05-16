import 'package:flutter/material.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF7D6DC),

      body: Center(
        child: Text("Quiz & Game 🎮", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
