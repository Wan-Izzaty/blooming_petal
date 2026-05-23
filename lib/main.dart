import 'package:flutter/material.dart';
import 'navigation_screen.dart';
import 'package:firebase_core/firebase_core.dart'; // tambah ni
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
