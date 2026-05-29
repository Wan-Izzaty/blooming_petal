import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'background_screen.dart';

class TetapanScreen extends StatefulWidget {
  const TetapanScreen({super.key});

  @override
  State<TetapanScreen> createState() => _TetapanScreenState();
}

class _TetapanScreenState extends State<TetapanScreen> {
  String _saizTulisan = "Sederhana";
  String _temaWarna = "Merah Jambu";

  @override
  void initState() {
    super.initState();
    _muatTetapan();
  }

  // 📂 BACA DATA DARI MEMORI
  Future<void> _muatTetapan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _saizTulisan = prefs.getString('saiz_tulisan') ?? "Sederhana";
      _temaWarna = prefs.getString('tema_warna') ?? "Merah Jambu";
    });
  }

  // 💾 SIMPAN DATA KE MEMORI
  Future<void> _simpanTetapan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('saiz_tulisan', _saizTulisan);
    await prefs.setString('tema_warna', _temaWarna);
  }

  // 📝 FUNGSI PILIH SAIZ TULISAN
  void _pilihSaizTulisan() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Pilih Saiz Tulisan"),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text("Kecil"),
              trailing: _saizTulisan == "Kecil"
                  ? const Icon(Icons.check_circle, color: Colors.pink)
                  : null,
              onTap: () {
                setState(() => _saizTulisan = "Kecil");
                _simpanTetapan();
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Sederhana"),
              trailing: _saizTulisan == "Sederhana"
                  ? const Icon(Icons.check_circle, color: Colors.pink)
                  : null,
              onTap: () {
                setState(() => _saizTulisan = "Sederhana");
                _simpanTetapan();
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Besar"),
              trailing: _saizTulisan == "Besar"
                  ? const Icon(Icons.check_circle, color: Colors.pink)
                  : null,
              onTap: () {
                setState(() => _saizTulisan = "Besar");
                _simpanTetapan();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  // 🎨 PILIH TEMA WARNA
  void _pilihTemaWarna() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Pilih Tema Warna"),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.circle, color: Colors.pink),
              title: const Text("Merah Jambu"),
              trailing: _temaWarna == "Merah Jambu"
                  ? const Icon(Icons.check_circle)
                  : null,
              onTap: () {
                setState(() => _temaWarna = "Merah Jambu");
                _simpanTetapan();
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.circle, color: Colors.purple),
              title: const Text("Ungu Lembut"),
              trailing: _temaWarna == "Ungu Lembut"
                  ? const Icon(Icons.check_circle)
                  : null,
              onTap: () {
                setState(() => _temaWarna = "Ungu Lembut");
                _simpanTetapan();
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.circle, color: Colors.blue),
              title: const Text("Biru Langit"),
              trailing: _temaWarna == "Biru Langit"
                  ? const Icon(Icons.check_circle)
                  : null,
              onTap: () {
                setState(() => _temaWarna = "Biru Langit");
                _simpanTetapan();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(
            'TETAPAN',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
          children: [
            const SizedBox(height: 20),

            // 🎨 BAHAGIAN PAPARAN & GAYA
            const Text(
              "Paparan & Gaya",
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 10),
            Card(
              color: Colors.white.withOpacity(0.8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.text_fields, color: Colors.pink),
                    title: const Text("Saiz Tulisan"),
                    subtitle: Text("Pilihan Semasa: $_saizTulisan"),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey,
                    ),
                    onTap: _pilihSaizTulisan,
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.color_lens, color: Colors.pink),
                    title: const Text("Tema Warna"),
                    subtitle: Text("Pilihan Semasa: $_temaWarna"),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey,
                    ),
                    onTap: _pilihTemaWarna,
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.language, color: Colors.pink),
                    title: const Text("Bahasa"),
                    subtitle: const Text("Bahasa Melayu"),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "🇲🇾 Aplikasi ini menggunakan Bahasa Melayu sepenuhnya.",
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // 📚 BAHAGIAN BANTUAN & MAKLUMAT
            const Text(
              "Bantuan & Maklumat",
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 10),
            Card(
              color: Colors.white.withOpacity(0.8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.help_outline, color: Colors.pink),
                    title: const Text("Cara Guna Aplikasi"),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Panduan Ringkas"),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          content: const Text(
                            "1. Bahagian 'Kenali Haid Anda' untuk ilmu pengetahuan.\n2. Bahagian 'Panduan Islam' untuk panduan islamik. \n3. Bahagian 'Kuiz' untuk menguji kefahaman.\n3. Tetapkan saiz tulisan ikut keselesaan anda di sini.",
                            textAlign: TextAlign.justify,
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text(
                                "Tutup",
                                style: TextStyle(color: Colors.pink),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.book_online, color: Colors.pink),
                    title: const Text("Sumber Rujukan"),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Sumber Ilmu"),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          content: const Text(
                            "Kandungan berdasarkan panduan kesihatan sahih dan hukum syarak Mazhab Syafi'i.",
                            textAlign: TextAlign.justify,
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text(
                                "Tutup",
                                style: TextStyle(color: Colors.pink),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(
                      Icons.privacy_tip_outlined,
                      color: Colors.pink,
                    ),
                    title: const Text("Dasar Privasi"),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Dasar Privasi"),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          content: const Text(
                            "Aplikasi ini TIDAK mengumpul, menyimpan atau berkongsi sebarang data peribadi pengguna. Semua tetapan disimpan secara tempatan di dalam peranti anda sahaja.",
                            textAlign: TextAlign.justify,
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text(
                                "Tutup",
                                style: TextStyle(color: Colors.pink),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.info_outline, color: Colors.pink),
                    title: const Text("Tentang Aplikasi"),
                    subtitle: const Text("Versi 1.0.0"),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Blooming Petal"),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          content: const Text(
                            "Aplikasi pendidikan untuk remaja wanita. Matlamat kami menyampaikan ilmu kesihatan wanita dan agama dengan cara yang mudah difahami.",
                            textAlign: TextAlign.justify,
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text(
                                "Tutup",
                                style: TextStyle(color: Colors.pink),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // 🌸 LOGO
            Image.asset('assets/images/logo.png', height: 80),
            const SizedBox(height: 10),

            // 📌 HAK CIPTA
            const Center(
              child: Text(
                "© 2025 Blooming Petal | Aplikasi Pendidikan",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
