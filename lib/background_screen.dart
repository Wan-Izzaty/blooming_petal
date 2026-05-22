import 'package:flutter/material.dart'; // ✅ WAJIB ADA BARIS NI!

class BackgroundWrapper extends StatelessWidget {
  final Widget child;

  const BackgroundWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE6EE), // Warna pink lembut awak
      body: Stack(
        children: [
          // 🌸 Bunga Kiri Atas - Guna Icon
          Positioned(
            top: -20,
            left: -20,
            child: Opacity(
              opacity: 0.65, // Pudar sikit supaya tak ganggu baca tulisan
              child: Image.asset(
                'assets/images/flower1.png', // 🔴 TUKAR NAMA SAMA PERSIS DENGAN FAIL AWAK
                width: 180, // Saiz bunga
                fit: BoxFit.contain,
              ),
            ),
          ),

          // 🌸 2. BUNGA ATAS KANAN
          Positioned(
            top: 30,
            right: -30,
            child: Opacity(
              opacity: 0.65,
              child: Image.asset(
                'assets/images/flower2.png', // 🔴 TUKAR NAMA AWAK
                width: 150,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // 🌸 3. BUNGA BAWAH KIRI
          Positioned(
            bottom: 50, // Tinggikan sikit supaya tak tutup navigation bar
            left: -10,
            child: Opacity(
              opacity: 0.95,
              child: Image.asset(
                'assets/images/flower3.png', // 🔴 TUKAR NAMA AWAK
                width: 160,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // 🌸 4. BUNGA BAWAH KANAN
          Positioned(
            bottom:
                80, // JANGAN JATUH SANGAT! Tinggikan sebab nak letak Navigation Bar
            right: -20,
            child: Opacity(
              opacity: 0.65,
              child: Image.asset(
                'assets/images/flower4.png', // 🔴 TUKAR NAMA AWAK
                width: 200,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // 📱 ISI KANDUNGAN AWAK (Menu / Teks / Grid)
          // Kita guna SafeArea supaya tulisan tak tertindan dengan bunga atau status bar
          SafeArea(child: child),
        ],
      ),
    );
  }
}
