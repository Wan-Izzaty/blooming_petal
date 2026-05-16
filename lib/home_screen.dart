import 'package:flutter/material.dart';

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
                      onTabChange?.call(1); // ✅ switch to Kenali tab
                    },
                  ),

                  menuButton(
                    icon: Icons.menu_book,
                    title: "Panduan Islam",
                    onTap: () {
                      onTabChange?.call(2); // Islam tab
                    },
                  ),

                  menuButton(
                    icon: Icons.games,
                    title: "Quiz & Game",
                    onTap: () {
                      onTabChange?.call(3); // Quiz tab
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
