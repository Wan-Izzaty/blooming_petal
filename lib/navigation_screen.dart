import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'kenali_screen.dart';
import 'islamic_screen.dart';
import 'quiz_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const HomeScreen(),
    const KenaliScreen(),
    const IslamScreen(),
    const QuizScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        type: BottomNavigationBarType.fixed,

        backgroundColor: const Color(0xFF8E3B52),

        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),

          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Kenali"),

          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "Islam"),

          BottomNavigationBarItem(icon: Icon(Icons.games), label: "Quiz"),
        ],
      ),
    );
  }
}
