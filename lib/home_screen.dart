import 'package:flutter/material.dart';
import 'background_screen.dart';

class HomeScreen extends StatelessWidget {
  final Function(int index)? onTabChange;

  const HomeScreen({super.key, this.onTabChange});

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
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(2, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 45, color: Colors.pink),
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
      backgroundColor: const Color(0xFFFFE6EE),

      // ❌ Saya buka AppBar kat sini ikut citarasa awak tadi kalau nak bersih,
      // tapi kalau nak kekalkan, tak apa biar je.
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40), // Tambah jarak atas sikit
            Row(
              children: const [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: Colors.pink),
                ),
                SizedBox(width: 10),
                Text(
                  "Hi, Welcome Back 🌸",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 30),
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
                      onTabChange?.call(1); // ✅ Pindah ke tab 1 (Kenali)
                    },
                  ),
                  menuButton(
                    icon: Icons.menu_book,
                    title: "Panduan Islam",
                    onTap: () {
                      onTabChange?.call(2); // ✅ Pindah ke tab 2 (Islam)
                    },
                  ),
                  menuButton(
                    icon: Icons.games,
                    title: "Quiz & Game",
                    onTap: () {
                      onTabChange?.call(3); // ✅ Pindah ke tab 3 (Quiz)
                    },
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
