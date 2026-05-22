import 'package:flutter/material.dart';
import 'background_screen.dart'; // ✅ IMPORT LATAR BELAKANG BUNGA

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
        // ✅ Saya tambah Opacity sikit supaya bunga belakang nampak, nampak lagi cantik
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(
            0.85,
          ), // ❤️ Nilaian ni boleh ubah 0.8 - 1.0
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
      // ❌ Tak ada AppBar, bersih macam awak nak

      // ✅ BAHAGIAN PENTING: BALUT SEMUA DENGAN BackgroundScreen
      body: BackgroundWrapper(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40), // Jarak dari atas skrin
              // Bahagian Hi User
              Row(
                children: const [
                  CircleAvatar(
                    // Ikut gaya kotak
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

              // Grid Menu
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
                        onTabChange?.call(
                          1,
                        ); // ✅ Fungsi tukar tab JALAN MACAM BIASA
                      },
                    ),
                    menuButton(
                      icon: Icons.menu_book,
                      title: "Panduan Islam",
                      onTap: () {
                        onTabChange?.call(
                          2,
                        ); // ✅ Fungsi tukar tab JALAN MACAM BIASA
                      },
                    ),
                    menuButton(
                      icon: Icons.games,
                      title: "Kuiz",
                      onTap: () {
                        onTabChange?.call(
                          3,
                        ); // ✅ Fungsi tukar tab JALAN MACAM BIASA
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
      ),
    );
  }
}
