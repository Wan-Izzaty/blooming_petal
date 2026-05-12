import 'package:flutter/material.dart';
import 'kenali_screen.dart'; // Import your new file

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
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget menuButton({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(16),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.pink),

            const SizedBox(height: 10),

            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8D7DA),

      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text("Blooming Petals"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const SizedBox(height: 10),

            const Text(
              "Hi, Welcome Back 🌸",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,

                children: [
                  menuButton(
                    icon: Icons.favorite,
                    title: "Kenali Haid Anda",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const KenaliScreen(),
                        ),
                      );
                    },
                  ),

                  menuButton(
                    icon: Icons.menu_book,
                    title: "Panduan Islam",
                    onTap: () {},
                  ),

                  menuButton(
                    icon: Icons.games,
                    title: "Quiz & Game",
                    onTap: () {},
                  ),

                  menuButton(
                    icon: Icons.settings,
                    title: "Tetapan",
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
