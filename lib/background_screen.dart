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
              opacity: 0.25, // Pudar sikit supaya tak ganggu baca tulisan
              child: Icon(
                Icons.local_florist, // Icon bunga
                size: 180,
                color: Colors.pink.shade300,
              ),
            ),
          ),

          // 🌸 Bunga Kanan Bawah - Guna Icon
          Positioned(
            bottom: -20,
            right: -20,
            child: Opacity(
              opacity: 0.25,
              child: Icon(
                Icons.local_florist,
                size: 150,
                color: Colors.pink.shade300,
              ),
            ),
          ),

          // 🌸 Bunga Kecil Tambahan (macam dalam contoh awak)
          Positioned(
            top: 80,
            right: 30,
            child: Opacity(
              opacity: 0.2,
              child: Icon(
                Icons.favorite, // Boleh tukar ikon lain kalau nak
                size: 50,
                color: Colors.pink.shade200,
              ),
            ),
          ),

          // 📱 KANDUNGAN UTAMA
          SafeArea(child: child),
        ],
      ),
    );
  }
}
