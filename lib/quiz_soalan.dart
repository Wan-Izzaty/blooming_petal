import 'package:flutter/material.dart';
import 'background_screen.dart';

class QuizSoalan extends StatefulWidget {
  final String jenisKuiz;
  const QuizSoalan({super.key, required this.jenisKuiz});

  @override
  State<QuizSoalan> createState() => _QuizSoalanState();
}

class _QuizSoalanState extends State<QuizSoalan> {
  late List<Map<String, dynamic>> senaraiSoalan;
  int nomborSoalan = 0;
  int? jawapanDipilih;
  int jumlahSkor = 0;
  List<int?> senaraiJawapanPengguna = [];

  @override
  void initState() {
    super.initState();
    _siapkanSoalan();
    senaraiJawapanPengguna = List.filled(10, null);
  }

  void _siapkanSoalan() {
    if (widget.jenisKuiz == "general") {
      senaraiSoalan = [
        {
          "soalan":
              "Apakah maksud kitaran haid yang berlaku pada tubuh badan seorang wanita?",
          "pilihan": [
            "A. Satu proses semula jadi bulanan di mana tubuh bersedia untuk kemungkinan kehamilan",
            "B. Satu penyakit berjangkit yang berlaku akibat jangkitan bakteria",
            "C. roses pembentukan tulang dan otot yang berlaku pada fasa puberti sahaja",
            "D. Kesan sampingan daripada pemakanan yang tidak seimbang",
          ],
          "jawapanBetul": 0,
        },
        {
          "soalan": "Berapakah jangka masa biasa kitaran haid seorang wanita?",
          "pilihan": ["A. 14 Hari", "B. 28 Hari", "C. 45 Hari", "D. 7 Hari"],
          "jawapanBetul": 1,
        },
        {
          "soalan": "Berapa hari tempoh pendarahan haid yang dianggap normal?",
          "pilihan": [
            "A. 1-2 Hari",
            "B. 3-7 Hari",
            "C. 10-14 Hari",
            "D. 15-20 Hari",
          ],
          "jawapanBetul": 1,
        },
        {
          "soalan":
              "Antara berikut, yang manakah merupakan perubahan bentuk badan yang biasa dialami oleh gadis remaja semasa puberti?",
          "pilihan": [
            "A. Pinggul menjadi lebih lebar dan badan mengumpul lemak di sekitar pinggul serta paha",
            "B. Ketinggian badan akan berhenti meningkat secara mendadak",
            "C. Bahu menjadi sangat lebar manakala pinggul mengecil",
            "D. Badan kehilangan semua lemak untuk membentuk otot yang keras",
          ],
          "jawapanBetul": 0,
        },
        {
          "soalan":
              "Apakah yang dimaksudkan dengan cecair jernih atau keputihan yang biasanya muncul sebelum haid pertama bermula?",
          "pilihan": [
            "A. Tanda bahawa seseorang itu tidak menjaga kebersihan diri dengan betul",
            "B. Darah haid yang telah bertukar warna menjadi putih disebabkan suhu badan yang sejuk",
            "C. Cecair semula jadi yang melekit atau sedikit basah sebagai tanda tubuh menghampiri fasa matang",
            "D. Sisa makanan yang tidak dicerna dengan baik oleh sistem penghadaman",
          ],
          "jawapanBetul": 2,
        },
        {
          "soalan":
              "Mengapakah remaja yang sedang mengalami kitaran haid atau puberti lebih mudah mendapat jerawat dan kulit berminyak?",
          "pilihan": [
            "A. Kerana mereka terlalu banyak menghabiskan masa di dalam rumah",
            "B. Disebabkan oleh kulit yang terlalu kering dan menggelupas",
            "C. Kerana sel-sel kulit berhenti membahagi dan memperbaharui diri",
            "D.Peningkatan aktiviti hormon merangsang kelenjar minyak untuk menghasilkan lebih banyak minyak",
          ],
          "jawapanBetul": 3,
        },
        {
          "soalan":
              "Bahan manakah yang sesuai digunakan untuk menyerap darah haid?",
          "pilihan": [
            "A. Kertas surat khabar",
            "B. Tisu nipis",
            "C. Pad wanita / Tuala Wanita",
            "D. Kain lama",
          ],
          "jawapanBetul": 2,
        },
        {
          "soalan": "Mengapa kebersihan diri sangat penting semasa haid?",
          "pilihan": [
            "A. Supaya wangi sahaja",
            "B. Tiada sebab khusus",
            "C. Ikut adat",
            "D. Elak jangkitan kuman & bau kurang sedap",
          ],
          "jawapanBetul": 3,
        },
        {
          "soalan":
              "Semasa fasa pra-haid (PMS), seorang gadis mungkin merasa sangat sensitif, mudah menangis, atau cepat marah. Apakah punca utama perubahan emosi ini?",
          "pilihan": [
            "A. Kerana mereka sengaja ingin menarik perhatian orang di sekeliling",
            "B. Kesan daripada kurang membaca buku atau kurang belajar",
            "C. Perubahan tahap hormon dalam badan yang mempengaruhi mood dan tahap tenaga",
            "D. Kerana cuaca persekitaran yang terlalu mendung",
          ],
          "jawapanBetul": 2,
        },
        {
          "soalan":
              "Berapa kerapkah anda digalakkan untuk menukar tuala wanita bagi memastikan kebersihan terjaga semasa haid?",
          "pilihan": [
            "A. Setiap 3 hingga 4 jam atau apabila ia sudah mula penuh",
            "B. Setiap 3 hingga 4 hari sekali sahaja",
            "C. Hanya apabila anda mahu mandi wajib sahaja",
            "D. Seminggu sekali selepas darah haid kering sepenuhnya",
          ],
          "jawapanBetul": 0,
        },
      ];
    } else {
      senaraiSoalan = [
        {
          "soalan":
              "Apakah hukum solat bagi wanita yang sedang mengalami haid?",
          "pilihan": [
            "A. Wajib solat biasa",
            "B. Digalakkan solat sunat sahaja",
            "C. Dilarang & tidak sah",
            "D. Solat sambil duduk",
          ],
          "jawapanBetul": 2,
        },
        {
          "soalan":
              "Apakah hukum berpuasa di bulan Ramadan bagi wanita yang sedang haid?",
          "pilihan": [
            "A. Wajib berpuasa",
            "B. Haram berpuasa, wajib ganti kemudian",
            "C. Boleh berpuasa jika kuat",
            "D. Puasa separuh hari sahaja",
          ],
          "jawapanBetul": 1,
        },
        {
          "soalan":
              "Bilakah seorang wanita wajib melakukan Mandi Wajib selepas haid?",
          "pilihan": [
            "A. Selepas 7 hari",
            "B. Apabila darah telah berhenti sepenuhnya",
            "C. Setiap pagi",
            "D. Sebelum tidur",
          ],
          "jawapanBetul": 1,
        },
        {
          "soalan": "Bolehkah wanita yang sedang haid membaca ayat Al-Quran?",
          "pilihan": [
            "A. Tidak boleh sama sekali",
            "B. Boleh dalam hati sahaja",
            "C. Boleh jika perlu belajar / mengajar",
            "D. Baca dengan memegang mushaf",
          ],
          "jawapanBetul": 2,
        },
        {
          "soalan":
              "Dalam Islam, pendarahan semula jadi bulanan yang keluar daripada rahim seorang wanita yang sihat dikenali sebagai darah apa?",
          "pilihan": [
            "A. Darah Nifas",
            "B. Darah Istihadah",
            "C. Darah Haid",
            "D. Darah Luka",
          ],
          "jawapanBetul": 2,
        },
        {
          "soalan":
              "Apakah status ibadah solat dan puasa bagi seorang wanita yang sedang mengalami pendarahan Istihadah (Pendarahan tidak normal)?",
          "pilihan": [
            "A. Dia wajib terus mendirikan solat dan berpuasa setelah membersihkan diri dan mengambil wuduk bagi setiap solat fardhu",
            "B. Dia dilarang sama sekali untuk bersolat dan berpuasa seperti orang yang haid",
            "C. Dia hanya perlu solat setahun sekali sahaja",
            "D. Dia boleh memilih untuk solat atau tidak mengikut keselesaan moodnya",
          ],
          "jawapanBetul": 0,
        },
        {
          "soalan": "Apakah nama darah yang keluar selepas tempoh bersalin?",
          "pilihan": [
            "A. Haid",
            "B. Istihadah",
            "C. Nifas",
            "D. Darah penyakit",
          ],
          "jawapanBetul": 2,
        },
        {
          "soalan": "Apakah maksud darah Istihadah?",
          "pilihan": [
            "A. Darah haid biasa",
            "B. Darah penyakit / keluar di luar waktu haid",
            "C. Darah selepas bersalin",
            "D. Darah kecederaan",
          ],
          "jawapanBetul": 1,
        },
        {
          "soalan":
              "Apakah dua (2) perkara yang menjadi rukun atau syarat sah paling asas dalam melakukan Mandi Wajib?",
          "pilihan": [
            "A. Memotong kuku tangan dan memakai minyak wangi yang mahal",
            "B. Niat untuk mengangkat hadas besar dan meratakan air ke seluruh anggota badan dengan sempurna",
            "C. Membaca surah Al-Fatihah sebanyak tiga kali sambil melompat",
            "D. Membilas badan menggunakan sabun herba tradisional sahaja",
          ],
          "jawapanBetul": 1,
        },
        {
          "soalan":
              "Mengikut sunnah Nabi SAW, apakah langkah awal yang sebaiknya dilakukan sebelum kita mula meratakan air ke seluruh badan semasa mandi wajib?",
          "pilihan": [
            "A. Terus menyiram air ke kepala tanpa membasuh tangan terlebih dahulu",
            "B. Menggosok gigi menggunakan arang kayu selama sejam",
            "C. Membasuh tangan, membersihkan bahagian kemaluan, dan mengambil wuduk",
            "D. Menjemur tuala mandi di bawah cahaya matahari terlebih dahulu",
          ],
          "jawapanBetul": 2,
        },
      ];
    }
  }

  void _fungsiNext() {
    if (jawapanDipilih == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("⚠️ Sila pilih jawapan dahulu!")),
      );
      return;
    }

    senaraiJawapanPengguna[nomborSoalan] = jawapanDipilih;

    if (jawapanDipilih == senaraiSoalan[nomborSoalan]['jawapanBetul']) {
      jumlahSkor++;
    }

    if (nomborSoalan < senaraiSoalan.length - 1) {
      setState(() {
        nomborSoalan++;
        jawapanDipilih = senaraiJawapanPengguna[nomborSoalan]; //
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HalamanSemakanJawapan(
            senaraiSoalan: senaraiSoalan,
            senaraiJawapanPengguna: senaraiJawapanPengguna,
            jumlahSkor: jumlahSkor,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ),

                Text(
                  widget.jenisKuiz == "general"
                      ? "Kuiz (General) 📚"
                      : "Kuiz (Islamic) 🕌",
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.85),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.pink.shade200),
              ),
              child: Text(
                "${nomborSoalan + 1}. ${senaraiSoalan[nomborSoalan]['soalan']}",
                style: const TextStyle(fontSize: 17, height: 1.5),
              ),
            ),

            const SizedBox(height: 30),

            ...List.generate(4, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    jawapanDipilih = index;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: jawapanDipilih == index
                        ? Colors.pink.shade100
                        : Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: jawapanDipilih == index
                          ? Colors.pink
                          : Colors.grey.shade300,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        senaraiSoalan[nomborSoalan]['pilihan'][index],
                        style: const TextStyle(fontSize: 17, height: 1.4),
                        textAlign: TextAlign.left,
                        softWrap: true,
                        overflow: TextOverflow.visible, //
                      ),
                    ],
                  ),
                ),
              );
            }),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _fungsiNext,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Next",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class HalamanSemakanJawapan extends StatelessWidget {
  final List<Map<String, dynamic>> senaraiSoalan;
  final List<int?> senaraiJawapanPengguna;
  final int jumlahSkor;

  const HalamanSemakanJawapan({
    super.key,
    required this.senaraiSoalan,
    required this.senaraiJawapanPengguna,
    required this.jumlahSkor,
  });

  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Semakan Jawapan 📝"),
          backgroundColor: const Color.fromARGB(255, 250, 91, 144),
          foregroundColor: Colors.black,
          automaticallyImplyLeading: false,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Selesai",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: senaraiSoalan.length,
          itemBuilder: (context, index) {
            final soalan = senaraiSoalan[index];
            final jawapanUser = senaraiJawapanPengguna[index];
            final jawapanBetul = soalan['jawapanBetul'];
            final betulKeTak = jawapanUser == jawapanBetul;

            return Container(
              margin: const EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.85),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: betulKeTak ? Colors.green : Colors.red,
                  width: 2,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${index + 1}. ${soalan['soalan']}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(height: 8),

                  Text(
                    "Jawapan Anda: ${jawapanUser != null ? soalan['pilihan'][jawapanUser] : 'Tidak dijawab'}",
                    style: TextStyle(
                      color: betulKeTak
                          ? Colors.green.shade700
                          : Colors.red.shade700,
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),

                  if (!betulKeTak)
                    Text(
                      "Jawapan Betul: ${soalan['pilihan'][jawapanBetul]}",
                      style: TextStyle(
                        color: Colors.green.shade800,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(20),
          color: Colors.pink.shade50,
          child: Text(
            "Markah Akhir: $jumlahSkor / 10",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
