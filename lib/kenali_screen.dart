import 'package:flutter/material.dart';
import 'video_player_screen.dart'; // ✅ PENTING: Import fail video

class KenaliScreen extends StatelessWidget {
  const KenaliScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCE4EC),
      appBar: AppBar(
        title: const Text("Kenali Haid Anda"),
        backgroundColor: Colors.pink,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(15),
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        children: [
          // ✅ SENARAI KOTAK - Betulkan path ikut folder assets awak
          _buildTopicCard(
            context,
            "Emosi ketika haid",
            "assets/images/emotion.png", // Lokasi gambar
            "Ini adalah penerangan panjang pasal emosi wanita ketika haid...",
            false, // <<--- FALSE = Bukan video
          ),
          _buildTopicCard(
            context,
            "Apa itu kitaran haid",
            "assets/videos/cycle_video.mp4", // Lokasi video
            "Penerangan pasal kitaran haid...",
            true, // <<--- TRUE = Ada video
          ),
          _buildTopicCard(
            context,
            "Jenis produk haid",
            "assets/images/products.png",
            "Penerangan pasal produk...",
            false,
          ),
          _buildTopicCard(
            context,
            "Kebersihan semasa haid",
            "assets/images/hygiene.png",
            "Penerangan pasal kebersihan...",
            false,
          ),
          _buildTopicCard(
            context,
            "Makanan patut/tidak patut",
            "assets/images/food.png",
            "Senarai makanan yang elok dan tidak elok dimakan...",
            false,
          ),
          _buildTopicCard(
            context,
            "Penjagaan haid",
            "assets/videos/penjagaan kebersihan ketika haid.mp4",
            "Cara menjaga diri semasa haid...",
            true,
          ),
        ],
      ),
    );
  }

  // ✅ FUNGSI BINA KOTAK
  Widget _buildTopicCard(
    BuildContext context,
    String title,
    String path,
    String description,
    bool isVideo, // ✅ Parameter ni WAJIB ADA
  ) {
    return GestureDetector(
      onTap: () {
        // ✅ BILA KLIK: Pindah skrin & hantar SEMUA data
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoPlayerScreen(
              title: title,
              videoPath: path,
              description: description,
              isVideo: isVideo, // ✅ Hantar nilai ke skrin video
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)],
        ),
        child: Column(
          children: [
            Expanded(
              child: isVideo
                  ? const Icon(
                      Icons.play_circle_fill,
                      size: 50,
                      color: Colors.pink,
                    )
                  : Image.asset(path, fit: BoxFit.cover), // ✅ Papar gambar
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
