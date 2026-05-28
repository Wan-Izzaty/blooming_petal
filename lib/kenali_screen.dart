import 'package:flutter/material.dart';
import 'background_screen.dart'; // Import background bunga
import 'video_player_screen.dart'; // Import skrin video

class KenaliScreen extends StatefulWidget {
  const KenaliScreen({super.key});

  @override
  State<KenaliScreen> createState() => _KenaliScreenState();
}

class _KenaliScreenState extends State<KenaliScreen> {
  String kataKunci = "";

  final List<Map<String, dynamic>> senaraiTopik = [
    {
      "title": "Emosi ketika haid",
      "thumbnail": "assets/images/period_emotion.jpeg",
      "image": [
        "assets/infographics/emosi1_haid.png",
        "assets/infographics/emosi2_haid.png",
      ],
      "desc":
          "Semasa haid, perubahan hormon boleh membuatkan emosi adik-adik jadi tidak stabil, cepat marah, sedih atau mudah menangis. Ini semua perkara biasa dan dialami hampir semua wanita.",
      "isVideo": false,
      "videoPath": "",
      "pesanUstazah":
          "Jangan risau kalau hati rasa tak sedap atau cepat merajuk waktu haid ya. Itu kesan hormon, bukan salah adik. Bertenang, rehat secukupnya dan buat benda yang menggembirakan hati 💕",
    },
    {
      "title": "Apa itu kitaran haid",
      "thumbnail": "assets/images/get_to_know_your_period.jpeg",
      "image": "assets/images/kiataran_haid.png",
      "desc":
          "Kitaran haid adalah proses bermula dari hari pertama darah keluar sehingga hari pertama haid bulan berikutnya. Purata kitaran normal adalah sekitar 21 hingga 35 hari.",
      "isVideo": true,
      "videoPath": "assets/videos/kitaran_haid.mp4",
      "pesanUstazah":
          "Faham pasal kitaran ni sangat penting ya. Bila adik tahu kira tarikh, adik boleh bersedia awal dan faham keadaan badan sendiri dengan lebih baik 📅✨",
    },
    {
      "title": "Jenis produk haid",
      "thumbnail": "assets/images/period_products.jpeg",
      "image": "assets/infographics/period_products.png",
      "desc":
          "Terdapat pelbagai jenis produk kebersihan wanita seperti tuala wanita, tampon, cawan haid dan seluar haid. Setiap satu ada cara penggunaan dan kelebihan tersendiri mengikut keselesaan masing-masing.",
      "isVideo": true,
      "videoPath": "assets/videos/Period_products.mp4",
      "pesanUstazah":
          "Banyak pilihan produk di pasaran, tapi adik-adik kena pandai pilih yang sesuai dengan diri dan selesa. Yang paling penting, pastikan ia bersih dan selamat digunakan ya 🩸",
    },
    {
      "title": "kebersihan ketika haid",
      "thumbnail": "assets/images/period_hygiene.jpeg",
      "image": "assets/images/penjagaan.png",
      "desc":
          "Menjaga kebersihan diri semasa haid adalah wajib. Pastikan menukar tuala wanita setiap 4 hingga 6 jam, membersihkan alat sulit dengan cara yang betul dan kerap membasuh tangan.",
      "isVideo": true,
      "videoPath": "assets/videos/penjagaan_kebersihan.mp4",
      "pesanUstazah":
          "Kebersihan adalah sebahagian daripada iman tau. Badan bersih, kita rasa selesa, elak kuman datang, dan ibadah kita jadi lebih sempurna. Jaga diri elok-elok ya 🧼🌸",
    },
    {
      "title": "Makanan semasa haid",
      "thumbnail": "assets/images/period_food.jpeg",
      "image": [
        "assets/infographics/period_food1.png",
        "assets/infographics/period_food2.png",
      ],
      "desc":
          "Semasa haid, badan perlukan nutrisi yang baik. Amalkan makanan kaya zat besi, buah-buahan dan air kosong. Kurangkan makanan berlemak, terlalu manis atau berkafein untuk kurangkan rasa sakit perut.",
      "isVideo": false,
      "videoPath": "",
      "pesanUstazah":
          "Jaga pemakanan masa haid ni sangat bagus untuk kurangkan rasa lenguh atau sakit. Banyakkan minum air kosong dan makan benda sihat ya, supaya badan kekal bertenaga 💪🍎",
    },
    {
      "title": "Perubahan badan setelah haid",
      "thumbnail": "assets/images/body_change.jpeg",
      "image": [
        "assets/infographics/body_change_1.png",
        "assets/infographics/body_change_2.png",
        "assets/infographics/body_change_3.png",
        "assets/infographics/body_change_4.png",
        "assets/infographics/body_change_5.png",
        "assets/infographics/body_change_6.png",
        "assets/infographics/body_change_7.png",
        "assets/infographics/body_change_8.png",
        "assets/infographics/body_change_9.png",
      ],
      "desc":
          "Haid adalah tanda kematangan diri. Selepas mula haid, badan akan mengalami banyak perubahan fizikal seperti bentuk badan, tumbuh rambut halus, dan perubahan suara. Ini semua proses menjadi dewasa.",
      "isVideo": false,
      "videoPath": "",
      "pesanUstazah":
          "Semua perubahan pada badan ni tanda adik-adik sedang membesar dan matang. Jangan malu atau risau, itu cara Allah jadikan wanita makin cantik dan sempurna ciptaan-Nya 🌷",
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> hasilCarian = senaraiTopik.where((topik) {
      return topik["title"].toLowerCase().contains(kataKunci.toLowerCase());
    }).toList();

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
              // 🔎 KOTAK CARIAN (YANG AWAK NAK UBAH)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: TextField(
                  // ✅ BILA TEKS BERUBAH, KITA SIMPAN & BINA SEMULA SENARAI
                  onChanged: (teksDitaip) {
                    setState(() {
                      kataKunci = teksDitaip;
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: "Cari panduan...",
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search, color: Colors.pink),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // 📋 SENARAI GRID (AKAN BERUBAH IKUT CARIAN)
              Expanded(
                child: hasilCarian.isEmpty
                    // Kalau tak jumpa apa-apa
                    ? const Center(
                        child: Text(
                          "Topik tidak dijumpai 😔",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      )
                    // Kalau ada hasil, tunjuk dalam grid
                    : GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        children: hasilCarian.map((topik) {
                          return _buildMenuCard(
                            context,
                            topik["title"],
                            topik["thumbnail"],
                            topik["image"],
                            topik["desc"],
                            topik["isVideo"],
                            videoPath: topik["videoPath"],
                            pesanUstazah: topik["pesanUstazah"],
                          );
                        }).toList(),
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
    dynamic thumbnail,
    dynamic imagePaths,
    String desc,
    bool isVideo, {
    String videoPath = "",
    String pesanUstazah = "",
  }) {
    String? thumbnailPath;
    if (thumbnail is List && thumbnail.isNotEmpty) {
      thumbnailPath = thumbnail[0];
    } else if (thumbnail is String) {
      thumbnailPath = thumbnail;
    }
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
              ustazahMessage: pesanUstazah,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: (thumbnailPath != null && thumbnailPath.isNotEmpty)
                    ? Image.asset(
                        thumbnailPath,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(
                              Icons.local_florist,
                              size: 60,
                              color: Colors.pink,
                            ),
                      )
                    : const Icon(
                        Icons.local_florist,
                        size: 60,
                        color: Colors.pink,
                      ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
