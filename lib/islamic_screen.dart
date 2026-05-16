import 'package:flutter/material.dart';

class IslamScreen extends StatelessWidget {
  const IslamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF7D6DC),

      body: Center(
        child: Text("Panduan Islam 🕌", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
