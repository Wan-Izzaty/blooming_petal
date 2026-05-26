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
                        "assets/infographics/emosi1_haid.png",
                        "assets/infographics/emosi2_haid.png",
                      ],
                      "Penerangan emosi ketika haid...",
                      false,
                      pesanUstazah:
                          "Jangan risau kalau hati rasa tak sedap atau cepat merajuk waktu haid ya. Itu kesan hormon, bukan salah adik. Bertenang, rehat secukupnya dan buat benda yang menggembirakan hati 💕",
                    ),

                    // ✅ KHAS UNTUK MANDI WAJIB (Ada Video)
                    _buildMenuCard(
                      context,
                      "Apa itu kitaran haid",
                      "assets/images/kiataran_haid.png",
                      "Kitaran haid ialah...",
                      true, // TRUE sebab ada video
                      videoPath: "assets/videos/kitaran_haid.mp4",
                      pesanUstazah:
                          "Faham pasal kitaran ni sangat penting ya. Bila adik tahu kira tarikh, adik boleh bersedia awal dan faham keadaan badan sendiri dengan lebih baik 📅✨",
                    ),

                    _buildMenuCard(
                      context,
                      "Jenis produk haid",
                      "assets/infographics/period_products.png",
                      "Berikut adalah jenis-jenis produk...",
                      true, // TRUE sebab ada video
                      videoPath: "assets/videos/Period_products.mp4",
                      pesanUstazah:
                          "Banyak pilihan produk di pasaran, tapi adik-adik kena pandai pilih yang sesuai dengan diri dan selesa. Yang paling penting, pastikan ia bersih dan selamat digunakan ya 🩸",
                    ),

                    _buildMenuCard(
                      context,
                      "kebersihan ketika haid",
                      "assets/images/penjagaan.png",
                      "Penerangan tentang penjagaan...",
                      true, // TRUE sebab ada video
                      videoPath: "assets/videos/penjagaan_kebersihan.mp4",
                      pesanUstazah:
                          "Kebersihan adalah sebahagian daripada iman tau. Badan bersih, kita rasa selesa, elak kuman datang, dan ibadah kita jadi lebih sempurna. Jaga diri elok-elok ya 🧼🌸",
                    ),
                    _buildMenuCard(
                      context,
                      "Makanan semasa haid",
                      [
                        "assets/infographics/period_food1.png",
                        "assets/infographics/period_food2.png",
                      ],
                      "Penerangan tentang makanan yang patut dielakkan dan patut dimakan..",
                      false,
                      pesanUstazah:
                          "Jaga pemakanan masa haid ni sangat bagus untuk kurangkan rasa lenguh atau sakit. Banyakkan minum air kosong dan makan benda sihat ya, supaya badan kekal bertenaga 💪🍎",
                    ),
                    _buildMenuCard(
                      context,
                      "Perubahan badan setelah haid",
                      [
                        "assets/infographics/body_change_1.png",
                        "assets/infographics/body_change_2.png",
                        "assets/infographics/body_change_3.png",
                        "assets/infographics/body_change_4.png",
                        "assets/infographics/body_change_5.png",
                        "assets/infographics/body_change_5.png",
                        "assets/infographics/body_change_6.png",
                        "assets/infographics/body_change_7.png",
                        "assets/infographics/body_change_8.png",
                        "assets/infographics/body_change_9.png",
                      ],
                      "Kenapa badan kita berubah...",
                      false,
                      pesanUstazah:
                          "Semua perubahan pada badan ni tanda adik-adik sedang membesar dan matang. Jangan malu atau risau, itu cara Allah jadikan wanita makin cantik dan sempurna ciptaan-Nya 🌷",
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
    String pesanUstazah = "",
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
              ustazahMessage: pesanUstazah,
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
