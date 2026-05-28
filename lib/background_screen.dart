import 'package:flutter/material.dart';

class BackgroundWrapper extends StatelessWidget {
  final Widget child;

  const BackgroundWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE6EE),

      body: Stack(
        fit: StackFit.expand, // Kekalkan untuk penuhkan skrin
        children: [
          // 🌸 Bunga Kiri Atas
          Positioned(
            top: -20,
            left: -60,
            child: Opacity(
              opacity: 0.30,
              child: Image.asset(
                'assets/images/bunga purple.png',
                width: 180,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // 🌸 BUNGA ATAS KANAN
          Positioned(
            top: 10,
            right: 10,
            child: Opacity(
              opacity: 0.30,
              child: Image.asset(
                'assets/images/bunga merah.png',
                width: 100,
                fit: BoxFit.contain,
              ),
            ),
          ),
          //Bunga kuning tengah tengah
          Positioned(
            top: 200,
            right: -50,
            child: Opacity(
              opacity: 0.60,
              child: Image.asset(
                'assets/images/bunga kuning.png',
                width: 130,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // 🌸 BUNGA BAWAH KIRI
          Positioned(
            bottom: 30,
            left: -60,
            child: Opacity(
              opacity: 0.30,
              child: Image.asset(
                'assets/images/bunga merah.png',
                width: 140,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // 🌸 BUNGA BAWAH KANAN
          Positioned(
            bottom: 70,
            right: -55,
            child: Opacity(
              opacity: 0.30,
              child: Image.asset(
                'assets/images/bunga pink.png',
                width: 200,
                fit: BoxFit.contain,
              ),
            ),
          ),

          Positioned.fill(child: SafeArea(child: child)),
        ],
      ),
    );
  }
}
