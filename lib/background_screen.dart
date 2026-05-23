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
            left: -20,
            child: Opacity(
              opacity: 0.65,
              child: Image.asset(
                'assets/images/flower1.png',
                width: 180,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // 🌸 BUNGA ATAS KANAN
          Positioned(
            top: 30,
            right: -30,
            child: Opacity(
              opacity: 0.65,
              child: Image.asset(
                'assets/images/flower2.png',
                width: 150,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // 🌸 BUNGA BAWAH KIRI
          Positioned(
            bottom: 50,
            left: -10,
            child: Opacity(
              opacity: 0.95,
              child: Image.asset(
                'assets/images/flower3.png',
                width: 160,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // 🌸 BUNGA BAWAH KANAN
          Positioned(
            bottom: 80,
            right: -20,
            child: Opacity(
              opacity: 0.65,
              child: Image.asset(
                'assets/images/flower4.png',
                width: 200,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // ❤️ SINI PUNCANYA: Kita buang GestureDetector hantu tadi.
          // Guna Positioned.fill dibalut dengan SafeArea sahaja dah cukup untuk hidupkan butang bawah dia.
          Positioned.fill(
            child: SafeArea(
              child:
                  child, // <-- Menu & butang HomeScreen / LoginScreen duduk sini dengan aman
            ),
          ),
        ],
      ),
    );
  }
}
