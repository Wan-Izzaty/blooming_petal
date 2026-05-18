import 'package:flutter/material.dart';

//class QuizScreen extends StatelessWidget {
//const QuizScreen({super.key});

//@override
//Widget build(BuildContext context) {
//return const Scaffold(
//backgroundColor: Color(0xFFF7D6DC),

//body: Center(
//child: Text("Quiz & Game 🎮", style: TextStyle(fontSize: 24)),
//),
//);
//}
//}

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCE4EC),
      appBar: AppBar(
        title: const Text("Kuiz & Permainan"),
        backgroundColor: Colors.pink,
      ),
      body: const Center(
        child: Text("Bahagian Kuiz", style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
