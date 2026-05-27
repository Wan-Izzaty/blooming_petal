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
                      pesanUstazah:
                          "Banyakkan berzikir dan berdoa ya adik-adik. Bila hati rapat dengan Allah, semua urusan jadi tenang dan mudah. Amalkan selalu, nanti jadi kebiasaan yang indah ❤️",
                    ),

                    // ✅ KHAS UNTUK MANDI WAJIB (Ada Video)
                    _buildMenuCard(
                      context,
                      "Mandi wajib",
                      "assets/images/mandi.png",
                      "Mandi wajib adalah satu ibadah mensucikan diri daripada hadas besar, Ianya wajib dilakukan apabila darah haid berhenti sepenuhnya supaya dibolehkan melakukan ibadah seperti solat dan membaca Al-Quran.",
                      true,
                      videoPath: "assets/videos/panduan_mandi_wajib.mp4",
                      pesanUstazah:
                          "Mandi wajib ni syarat utama nak balik bersuci dan solat semula ya. Kena betulkan cara supaya sah ibadah kita.Untuk kefahaman adik-adik, tengok video ini sampai habis!❤️",
                    ),

                    _buildMenuCard(
                      context,
                      "Peralihan alam baligh",
                      [
                        "assets/infographics/akil_baligh_1.png",
                        "assets/infographics/akil_baligh_2.png",
                        "assets/infographics/akil_baligh_3.png",
                        "assets/infographics/akil_baligh_4.png",
                        "assets/infographics/akil_baligh_5.png",
                        "assets/infographics/akil_baligh_6.png",
                        "assets/infographics/akil_baligh_7.png",
                      ],
                      "Baligh adalah tanda seseorang itu sudah dewasa dan mula memikul tanggungjawab agama. Bermula waktu ini, segala amal ibadah dicatat pahalanya dan dosa juga dicatat perbuatannya.",
                      false,
                      pesanUstazah:
                          "Bila masuk alam baligh, maknanya adik dah jadi dewasa dalam mata syariat. Mulai sekarang, segala perbuatan dikira. Anggap ni permulaan hidup yang lebih matang dan indah bersama agama Allah ✨",
                    ),
                    _buildMenuCard(
                      context,
                      "Haid & Ramadhan",
                      [
                        "assets/infographics/ramadhan_1.png",
                        "assets/infographics/ramadhan_2.png",
                        "assets/infographics/ramadhan_3.png",
                        "assets/infographics/ramadhan_4.png",
                        "assets/infographics/ramadhan_5.png",
                        "assets/infographics/ramadhan_6.png",
                        "assets/infographics/ramadhan_.png",
                      ],
                      "Wanita yang sedang haid tidak diwajibkan berpuasa dan haram baginya berpuasa. Puasa yang ditinggalkan wajib diganti (qada') pada hari lain selepas suci, tetapi solat yang ditinggalkan tidak perlu diganti.",
                      false,
                      pesanUstazah:
                          "Pada bulan yang Mulia, kalau datang haid, adik tak boleh puasa dan tak perlu solat. Tapi jangan sedih, pahala niat puasa tetap ada. Nanti lepas suci, ganti balik puasa tu ya. Allah itu Maha Mengetahui keadaan kita 🤲",
                    ),
                    _buildMenuCard(
                      context,
                      "Kenali jenis darah",
                      [
                        "assets/infographics/jenis_darah_1.png",
                        "assets/infographics/jenis_darah_2.png",
                        "assets/infographics/jenis_darah_3.png",
                        "assets/infographics/jenis_darah_4.png",
                        "assets/infographics/jenis_darah_5.png",
                        "assets/infographics/jenis_darah_6.png",
                      ],

                      "Dalam syarak, darah yang keluar dari faraj dibahagikan kepada tiga: Haid, Istihadah dan Nifas. Setiap jenis darah ada hukum dan peraturan ibadah yang berbeza-beza, jadi penting untuk kenal bezanya.",
                      false,
                      pesanUstazah:
                          "Bukan semua darah yang keluar tu dikira haid tau adik-adik. Ada darah penyakit, ada darah nifas. Kalau salah anggap, nanti ibadah jadi tak betul. Belajar beza dia elok-elok kat sini ya 🩸",
                    ),
                    _buildMenuCard(
                      context,
                      "Tanda suci dari haid",
                      [
                        "assets/infographics/tanda_suci_1.png",
                        "assets/infographics/tanda_suci_2.png",
                        "assets/infographics/tanda_suci_3.png",
                        "assets/infographics/tanda_suci_4.png",
                        "assets/infographics/tanda_suci_5.png",
                        "assets/infographics/tanda_suci_6.png",
                      ],

                      "Tanda utama wanita suci daripada haid adalah berhenti sepenuhnya pengeluaran darah atau lendir, dan biasanya disusuli dengan keluarnya cairan putih jernih. Apabila sudah suci, wajib segera mandi wajib untuk menyambung kembali ibadah.",
                      false,
                      pesanUstazah:
                          "Bila darah dah berhenti dan keluar cecair putih jernih, itu tanda adik dah suci. Segera mandi wajib supaya boleh kembali dekat dengan Allah, solat dan baca Al-Quran semula. Jangan tangguh-tangguh ya ✨",
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
