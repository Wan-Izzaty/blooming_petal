import 'package:flutter/material.dart';

//class IslamScreen extends StatelessWidget {
//const IslamScreen({super.key});

//@override
// Widget build(BuildContext context) {
// return const Scaffold(
//  backgroundColor: Color(0xFFF7D6DC),

// body: Center(
//   child: Text("Panduan Islam 🕌", style: TextStyle(fontSize: 24)),
// ),
//  );
// }
//}
class IslamScreen extends StatelessWidget {
  const IslamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCE4EC),
      appBar: AppBar(
        title: const Text("Panduan Islam"),
        backgroundColor: Colors.pink,
      ),
      body: const Center(
        child: Text(
          "Kandungan Panduan Islam / Mandi Wajib letak kat sini",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
