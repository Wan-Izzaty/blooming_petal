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

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      // Bila kat sini, kita hantar fungsi tukar page ke HomeScreen
      HomeScreen(
        onTabChange: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      const KenaliScreen(),
      const IslamScreen(),
      const QuizScreen(),
    ];

    return Scaffold(
      body: pages[currentIndex],

      // ✅ LOGIK PENTING: Navigation bar hanya muncul jika BUKAN page 0 (Home)
      bottomNavigationBar: currentIndex == 0
          ? null // Kalau kat Home, bar jadi tiada
          : BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: const Color(0xFF8E3B52), // Warna maroon awak
              selectedItemColor: Colors.yellow,
              unselectedItemColor: Colors.white,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: "Kenali",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu_book),
                  label: "Islam",
                ),
                BottomNavigationBarItem(icon: Icon(Icons.games), label: "Quiz"),
              ],
            ),
    );
  }
}
