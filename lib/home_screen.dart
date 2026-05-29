import 'package:flutter/material.dart';
import 'background_screen.dart';
import 'tentang_screen.dart';

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
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(
            0.85,
          ), // ❤️ Nilaian opacity latar belakang
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
            Icon(icon, size: 50, color: Colors.pink),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 🌸 Menukar BackgroundWrapper kepada BackgroundScreen mengikut nama kelas fail kita
    return BackgroundWrapper(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40), // Jarak dari atas skrin
            // Bahagian Hi User
            Row(
              children: const [
                Text(
                  "🌸 Hi, Welcome Back 🌸",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
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
                    icon: Icons.filter_vintage_rounded,
                    title: "Kenali Haid Anda",
                    onTap: () {
                      onTabChange?.call(1); // Tukar ke Tab 1
                    },
                  ),
                  menuButton(
                    icon: Icons.brightness_4_rounded,
                    title: "Panduan Islam",
                    onTap: () {
                      onTabChange?.call(2); // Tukar ke Tab 2
                    },
                  ),
                  menuButton(
                    icon: Icons.games_rounded,
                    title: "Kuiz",
                    onTap: () {
                      onTabChange?.call(3); // Tukar ke Tab 3
                    },
                  ),

                  // 🔘 BUTANG TETAPAN DIUBAH SINI:
                  menuButton(
                    icon: Icons.info_rounded,
                    title: "Tentang Aplikasi",
                    onTap: () {
                      // Buka SettingsScreen sebagai halaman baru di atas skrin semasa
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const TentangScreen(),
                        ),
                      );
                    },
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
