import 'package:flutter/material.dart';
import 'video_player_screen.dart'; // Pastikan import fail ni
import 'background_screen.dart';

class IslamScreen extends StatelessWidget {
  const IslamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Panduan Islam",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      // ✅ BAHAGIAN PENTING: BALUT SEMUA KANDUNGAN DENGAN BackgroundScreen
      body: BackgroundWrapper(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Bahagian Search Bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(
                    0.85,
                  ), // Opacity sikit nampak cantik atas bunga
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Cari panduan...",
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Grid 6 Kotak Panduan
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: [
                    _buildMenuCard(
                      context,
                      "Zikir dan doa",
                      "assets/images/zikir.png",
                      "Penerangan tentang zikir...",
                      false,
                    ),

                    // ✅ KHAS UNTUK MANDI WAJIB (Ada Video)
                    _buildMenuCard(
                      context,
                      "Mandi wajib",
                      "assets/images/mandi.png",
                      "Berikut adalah cara mandi wajib yang betul mengikut syarak...",
                      true,
                      videoPath: "assets/videos/mandi_wajib.mp4",
                    ),

                    _buildMenuCard(
                      context,
                      "Peralihan alam baligh",
                      "assets/images/baligh.png",
                      "Penerangan alam baligh...",
                      false,
                    ),
                    _buildMenuCard(
                      context,
                      "Panduan Ramadhan",
                      "assets/images/ramadhan.png",
                      "Penerangan puasa...",
                      false,
                    ),
                    _buildMenuCard(
                      context,
                      "Kenali jenis darah",
                      "assets/images/darah.png",
                      "Penerangan jenis darah...",
                      false,
                    ),
                    _buildMenuCard(
                      context,
                      "Bersih dari haid",
                      "assets/images/bersih.png",
                      "Penerangan cara bersuci...",
                      false,
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

  // Fungsi untuk bina kotak menu
  Widget _buildMenuCard(
    BuildContext context,
    String title,
    dynamic imagePaths,
    String desc,
    bool isVideo, {
    String videoPath = "",
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoPlayerScreen(
              title: title,
              description: desc,
              videoPath: videoPath,
              imagePaths: imagePaths,
              isVideo: isVideo,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(
            0.8,
          ), // ❤️ Opacity supaya bunga belakang nampak sikit
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🔴 GAMBAR: Nanti bila gambar awak dah siap dalam folder, buang Icon bawah ni, ganti dengan kod ni:
            // Image.asset(imagePath, width: 50, height: 50, fit: BoxFit.contain),
            const Icon(
              Icons.mosque,
              size: 50,
              color: Colors.pink,
            ), // Buang ni nanti
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
