import 'package:flutter/material.dart';
import 'background_screen.dart'; // Import background bunga
import 'video_player_screen.dart'; // Import skrin video

class KenaliScreen extends StatelessWidget {
  const KenaliScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Kenali haid Anda",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
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
                      "Emosi ketika haid",
                      [
                        "assets/infographics/emosi1_haid.jpg",
                        "assets/infographics/emosi2_haid.jpg",
                      ],
                      "Penerangan emosi ketika haid...",
                      false,
                    ),

                    // ✅ KHAS UNTUK MANDI WAJIB (Ada Video)
                    _buildMenuCard(
                      context,
                      "Apa itu kitaran haid",
                      "assets/images/kiataran_haid.png",
                      "Kitaran haid ialah...",
                      true, // TRUE sebab ada video
                      videoPath: "assets/videos/kitaran_haid.mp4",
                    ),

                    _buildMenuCard(
                      context,
                      "Jenis produk haid",
                      "assets/infographics/period_products.jpg",
                      "Berikut adalah jenis-jenis produk...",
                      false,
                    ),
                    _buildMenuCard(
                      context,
                      "kebersihan ketika haid",
                      "assets/images/penjagaan.png",
                      "Penerangan tentang penjagaan...",
                      true, // TRUE sebab ada video
                      videoPath: "assets/videos/penjagaan_kebersihan.mp4",
                    ),
                    _buildMenuCard(
                      context,
                      "Makanan semasa haid",
                      [
                        "assets/infographics/makanan1_haid.jpg",
                        "assets/infographics/makanan2_haid.jpg",
                      ],
                      "Penerangan tentang makanan yang patut dielakkan dan patut dimakan..",
                      false,
                    ),
                    _buildMenuCard(
                      context,
                      "Perubahan badan setelah haid",
                      "assets/images/berubah.png",
                      "Kenapa badan kita berubah...",
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
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ganti dengan Image.asset(imagePath) bila gambar dah ada
            const Icon(Icons.local_florist, size: 50, color: Colors.pink),
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
