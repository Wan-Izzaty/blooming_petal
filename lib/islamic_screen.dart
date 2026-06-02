import 'package:flutter/material.dart';
import 'video_player_screen.dart';
import 'background_screen.dart';

class IslamScreen extends StatefulWidget {
  const IslamScreen({super.key});

  @override
  State<IslamScreen> createState() => _IslamScreenState();
}

class _IslamScreenState extends State<IslamScreen> {
  String kataKunci = "";

  final List<Map<String, dynamic>> senaraiTopikIslamik = [
    {
      "title": "Zikir & Doa",
      "thumbnail": "assets/images/zikir_dan_doa.jpeg",
      "image": "assets/images/zikir_dan_doa.png",
      "desc":
          "Koleksi zikir dan doa harian, sesuai diamalkan ketika haid untuk ketenangan hati dan kesihatan badan.",
      "isVideo": false,
      "isAudio": true, //
      "videoPath": "",
      "ustazahPesan":
          "Bacalah zikir dan doa ni selalu ya adik-adik. Bila hati rapat dengan Allah, badan pun rasa tenang dan sihat ❤️",
      "senaraiDoa": [
        {
          "nama": "Zikir Tasbih",
          "arab":
              "سُبْحَانَ اللهِ، وَالْحَمْدُ لِلَّهِ، وَلَا إِلَهَ إِلَّا اللهُ، وَاللَّهُ أَكْبَرُ",
          "rumi": "Subhanallah, Alhamdulillah, La ilaha illallah, Allahu Akbar",
          "maksud":
              "Maha Suci Allah, Segala Puji bagi Allah, Tiada Tuhan selain Allah, Allah Maha Besar.",
          "audio": "audio/zikir_tasbih.mp3",
        },
        {
          "nama": "Istighfar",
          "arab": "أَسْتَغْفِرُ اللهَ",
          "rumi": "Astaghfirullah",
          "maksud": "Aku memohon ampun kepada Allah.",
          "audio": "audio/astagfirullah.mp3",
        },
        {
          "nama": "Selawat",
          "arab": "اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ",
          "rumi": "Allahumma salli 'ala Muhammadin wa 'ala ali Muhammad",
          "maksud":
              "Ya Allah, berikanlah rahmat ke atas Nabi Muhammad dan keluarga baginda.",
          "audio": "audio/selawat.mp3",
        },
        {
          "nama": "Doa Hilangkan Sakit Perut",
          "arab":
              "اللَّهُمَّ ربَّ النَّاسِ ، أَذْهِب الْبَأسَ ، واشْفِ ، أَنْتَ الشَّافي لا شِفَاءَ إِلاَّ شِفَاؤُكَ ، شِفاءً لا يُغَادِرُ سقَماً",
          "rumi":
              "Allahumma Rabban-naas, azhibil-ba’s, washfi antash-Shaafi laa shifaa’a illaa shifaa’uka, shifaa’an laa yughaadiru saqamaa",
          "maksud":
              "Ya Allah Tuhan sekalian manusia, hilangkanlah segala kesakitan ini, sembuhkanlah aku. Engkaulah Penyembuh, tiada penyembuhan selain penyembuhan-Mu, penyembuhan yang tidak meninggalkan sebarang penyakit.",
          "audio": "audio/doa_nyeri_haid.mp3",
        },
        {
          "nama": "Doa Hari Pertama Haid",
          "arab":
              "الْحَمْدُللهِ عَلَى كُلِّ حَالٍ وَأَسْتَغْفِرُ اللهَ مِنْ كُلِّ ذَنْبٍ",
          "rumi":
              "Alhamdulillahi ‘ala kulli halin, wa astaghfirullaha min kulli dzambin",
          "maksud":
              "Segala puji bagi Allah atas segala keadaan, dan aku memohon ampun kepada Allah daripada segala dosaku.",
          "audio": "audio/Doa_first_day_haid.mp3",
        },
      ],
    },
    {
      "title": "Mandi wajib",
      "thumbnail": "assets/images/ghusl.jpeg",
      "image": "assets/images/ghusl.png",
      "desc":
          "Mandi wajib adalah satu ibadah mensucikan diri daripada hadas besar. Ia wajib dilakukan apabila darah haid berhenti sepenuhnya supaya dibolehkan melakukan ibadah seperti solat dan membaca Al-Quran.",
      "isVideo": true,
      "isAudio": false,
      "videoPath": "assets/videos/panduan_mandi_wajib.mp4",
      "ustazahPesan":
          "Mandi wajib ni syarat utama nak balik bersuci dan solat semula ya. Kena betulkan cara supaya sah ibadah kita. Tengok video ni sampai habis, fahamkan langkah-langkahnya dengan teliti 🕌",
    },
    {
      "title": "Peralihan alam baligh",
      "thumbnail": "assets/images/akil_baligh_peralihan.jpeg",
      "image": [
        "assets/infographics/akil_baligh_1.png",
        "assets/infographics/akil_baligh_2.png",
        "assets/infographics/akil_baligh_3.png",
        "assets/infographics/akil_baligh_4.png",
        "assets/infographics/akil_baligh_5.png",
        "assets/infographics/akil_baligh_6.png",
        "assets/infographics/akil_baligh_7.png",
      ],
      "desc":
          "Baligh adalah tanda seseorang itu sudah dewasa dan mula memikul tanggungjawab agama. Bermula waktu ini, segala amal ibadah dicatat pahalanya dan dosa juga dicatat perbuatannya.",
      "isVideo": false,
      "isAudio": false,
      "videoPath": "",
      "ustazahPesan":
          "Bila masuk alam baligh, maknanya adik dah jadi dewasa dalam mata syariat. Mulai sekarang, segala perbuatan dikira. Anggap ni permulaan hidup yang lebih matang dan indah bersama agama Allah ✨",
    },
    {
      "title": "Haid & Ramadhan",
      "thumbnail": "assets/images/ramadhan.jpeg",
      "image": [
        "assets/infographics/ramadhan_1.png",
        "assets/infographics/ramadhan_2.png",
        "assets/infographics/ramadhan_3.png",
        "assets/infographics/ramadhan_4.png",
        "assets/infographics/ramadhan_5.png",
        "assets/infographics/ramadhan_6.png",
        "assets/infographics/ramadhan_.png",
      ],
      "desc":
          "Wanita yang sedang haid tidak diwajibkan berpuasa dan haram baginya berpuasa. Puasa yang ditinggalkan wajib diganti (qada') pada hari lain selepas suci, tetapi solat yang ditinggalkan tidak perlu diganti.",
      "isVideo": false,
      "isAudio": false,
      "videoPath": "",
      "ustazahPesan":
          "Pada bulan mulia, kalau datang haid, adik tak boleh puasa dan tak perlu solat. Tapi jangan sedih, pahala niat puasa tetap ada. Nanti lepas suci, ganti balik puasa tu ya. Allah itu Maha Mengetahui keadaan kita 🤲",
    },
    {
      "title": "Kenali jenis darah",
      "thumbnail": "assets/images/period_colors.jpeg",
      "image": [
        "assets/infographics/jenis_darah_1.png",
        "assets/infographics/jenis_darah_2.png",
        "assets/infographics/jenis_darah_3.png",
        "assets/infographics/jenis_darah_4.png",
        "assets/infographics/jenis_darah_5.png",
        "assets/infographics/jenis_darah_6.png",
      ],
      "desc":
          "Dalam syarak, darah yang keluar dari faraj dibahagikan kepada tiga: Haid, Istihadah dan Nifas. Setiap jenis darah ada hukum dan peraturan ibadah yang berbeza-beza, jadi penting untuk kenal bezanya.",
      "isVideo": false,
      "isAudio": false,
      "videoPath": "",
      "ustazahPesan":
          "Bukan semua darah yang keluar tu dikira haid tau adik-adik. Ada darah penyakit, ada darah nifas. Kalau salah anggap, nanti ibadah jadi tak betul. Belajar beza dia elok-elok kat sini ya 🩸",
    },
    {
      "title": "Tanda suci dari haid",
      "thumbnail": "assets/images/tanda_haid_tamat.jpeg",
      "image": [
        "assets/infographics/tanda_suci_1.png",
        "assets/infographics/tanda_suci_2.png",
        "assets/infographics/tanda_suci_3.png",
        "assets/infographics/tanda_suci_4.png",
        "assets/infographics/tanda_suci_5.png",
        "assets/infographics/tanda_suci_6.png",
      ],
      "desc":
          "Tanda utama wanita suci daripada haid adalah berhenti sepenuhnya pengeluaran darah atau lendir, dan biasanya disusuli dengan keluarnya cairan putih jernih. Apabila sudah suci, wajib segera mandi wajib untuk menyambung kembali ibadah.",
      "isVideo": false,
      "isAudio": false,
      "videoPath": "",
      "ustazahPesan":
          "Bila darah dah berhenti dan keluar cecair putih jernih, itu tanda adik dah suci. Segera mandi wajib supaya boleh kembali dekat dengan Allah, solat dan baca Al-Quran semula. Jangan tangguh-tangguh ya 🕋",
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> hasilCarian = senaraiTopikIslamik.where((topik) {
      return topik["title"].toLowerCase().contains(kataKunci.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Panduan Islam",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: TextField(
                  onChanged: (teksDitaip) {
                    setState(() {
                      kataKunci = teksDitaip;
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: "Cari panduan agama...", // ✅ Tukar sikit ayat
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search, color: Colors.pink),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Expanded(
                child: hasilCarian.isEmpty
                    ? const Center(
                        child: Text(
                          "Topik tidak dijumpai 😔",
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                      )
                    : GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
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
                            ustazahPesan: topik["ustazahPesan"],
                            isAudio: topik["isAudio"],
                            senaraiDoa: topik["senaraiDoa"],
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

  Widget _buildMenuCard(
    BuildContext context,
    String title,
    dynamic thumbnail,
    dynamic imagePaths,
    String desc,
    bool isVideo, {
    String videoPath = "",
    String ustazahPesan = "",
    bool isAudio = false,
    List<dynamic>? senaraiDoa,
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
              ustazahMessage: ustazahPesan,
              isAudio: isAudio,
              senaraiDoa: senaraiDoa,
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
                              Icons.mosque,
                              size: 60,
                              color: Colors.pink,
                            ),
                      )
                    : const Icon(Icons.mosque, size: 60, color: Colors.pink),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
