import 'package:flutter/material.dart';
import 'video_player_screen.dart'; // Pastikan import fail ni

//class IslamScreen extends StatelessWidget {
//const IslamScreen({super.key});

//@override
// Widget build(BuildContext context) {
// return const Scaffold(
//  backgroundColor: Color(0xFFF7D6DC),

// body: Center(
//   child: Text("Panduan Islam 🕌", style: TextStyle(fontSize: 24)),
// ),
//  );
// }
//}

class IslamScreen extends StatelessWidget {
  const IslamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE6EE),
      appBar: AppBar(
        title: const Text(
          "Panduan Islam",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Bahagian Search Bar (Macam dalam gambar awak)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
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
                    true, // TRUE sebab ada video
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
    );
  }

  // Fungsi untuk bina kotak menu
  Widget _buildMenuCard(
    BuildContext context,
    String title,
    String imagePath,
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
              imagePath: imagePath,
              isVideo: isVideo,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ganti dengan Image.asset(imagePath) bila gambar dah ada
            const Icon(Icons.mosque, size: 50, color: Colors.pink),
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
