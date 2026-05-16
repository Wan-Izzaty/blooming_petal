import 'package:flutter/material.dart';
import 'navigation_screen.dart';

void main() {
  runApp(const BloomingPetalsApp());
}

class BloomingPetalsApp extends StatelessWidget {
  const BloomingPetalsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Blooming Petals',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
      ),

      home: const NavigationScreen(),
    );
  }
}
