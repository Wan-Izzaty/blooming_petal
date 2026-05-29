import 'package:flutter/material.dart';
import 'background_screen.dart';

class TentangScreen extends StatefulWidget {
  const TentangScreen({super.key});

  @override
  State<TentangScreen> createState() => _TetapanScreenState();
}

class _TetapanScreenState extends State<TentangScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tentang Aplikasi',
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
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
          children: [
            const SizedBox(height: 30),
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
                  fontSize: 13,
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
