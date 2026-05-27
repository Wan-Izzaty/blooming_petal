import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'background_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart'; // ✅ IMPORT ANIMASI

class VideoPlayerScreen extends StatefulWidget {
  // ✅ UBAH SIKIT: Sekarang imagePaths boleh terima String ATAU List<String>
  final dynamic imagePaths;
  final String title;
  final String videoPath;
  final String description;
  final bool isVideo;
  final String ustazahMessage; // ✅ TAMBAH: Mesej ikut topik

  const VideoPlayerScreen({
    super.key,
    required this.title,
    required this.videoPath,
    required this.imagePaths, // Awak hantar macam biasa dari menu utama
    required this.description,
    this.isVideo = false,
    this.ustazahMessage = "", // Mesej asal
  });

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController? _controller;
  bool _isVideoReady = false;

  // ✅ UNTUK PAGE VIEW
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    if (widget.isVideo && widget.videoPath.isNotEmpty) {
      _controller = VideoPlayerController.asset(widget.videoPath)
        ..initialize().then((_) {
          setState(() {
            _isVideoReady = true;
          });
        });
    }
  }

  void _skip(int seconds) {
    if (_controller != null && _isVideoReady) {
      final currentPosition = _controller!.value.position;
      final targetPosition = currentPosition + Duration(seconds: seconds);
      _controller!.seekTo(targetPosition);
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    _pageController.dispose();
    super.dispose();
  }

  // ✅ FUNGSI BANTU: KIRA JUMLAH GAMBAR YANG DIHANTAR
  int _getImageCount() {
    if (widget.imagePaths is String) return 1; // Kalau biasa (1 je)
    if (widget.imagePaths is List)
      return widget.imagePaths.length; // Kalau senarai
    return 0;
  }

  // ✅ FUNGSI BANTU: AMBIL NAMA GAMBAR MENGIKUT NOMBOR
  String _getImageAt(int index) {
    if (widget.imagePaths is String) return widget.imagePaths;
    return widget.imagePaths[index];
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            widget.title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 🎥 VIDEO AREA (SAMA MACAM BIASA)
              if (widget.isVideo && _controller != null)
                Container(
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: _isVideoReady
                      ? Column(
                          children: [
                            AspectRatio(
                              aspectRatio: _controller!.value.aspectRatio,
                              child: VideoPlayer(_controller!),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    _controller!.value.isPlaying
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _controller!.value.isPlaying
                                          ? _controller!.pause()
                                          : _controller!.play();
                                    });
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.replay_10,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  onPressed: () => _skip(-10), // Tolak 10 saa
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.forward_10,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  onPressed: () => _skip(10), // Tambah 10 saat
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: VideoProgressIndicator(
                                      _controller!,
                                      allowScrubbing: true,
                                      colors: const VideoProgressColors(
                                        playedColor: Colors.pink,
                                        backgroundColor: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : const SizedBox(
                          height: 200,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.pink,
                            ),
                          ),
                        ),
                )
              // 🖼️ INFOGRAPHIC AREA - SEKARANG DIA PANDAI KIRA SENDIRI
              else
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      height: 380,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.85),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(color: Colors.black12, blurRadius: 6),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        // ✅ JIKA GAMBAR LEBIH 1, Guna PageView. KALAU 1 JE, Guna biasa.
                        child: _getImageCount() > 1
                            ? PageView(
                                controller: _pageController,
                                onPageChanged: (index) {
                                  setState(() => _currentPage = index);
                                },
                                children: List.generate(_getImageCount(), (
                                  index,
                                ) {
                                  return _buildImageWidget(_getImageAt(index));
                                }),
                              )
                            : _buildImageWidget(_getImageAt(0)), // <-- BIASA JE
                      ),
                    ),

                    // ✅ TANDA TITIK: MUNCUL JIKA ADA LEBIH 1 GAMBAR JE
                    if (_getImageCount() > 1)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(_getImageCount(), (index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: _currentPage == index ? 12 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: _currentPage == index
                                  ? Colors.pink
                                  : Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          );
                        }),
                      ),
                    const SizedBox(height: 10),
                  ],
                ),

              // 📖 DESCRIPTION TEXT
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    widget.description,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),

              // 👩🏫 ✅ BAHAGIAN BARU: WATAK USTAZAH + ANIMASI TULIS
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment
                      .end, // Supaya belon kata ikut bawah gambar
                  children: [
                    // 1. Gambar Ustazah
                    Image.asset(
                      'assets/images/ustazah1.png', // ✅ Pastikan nama fail sama persis!
                      width: 90, // Saiz gambar, boleh ubah
                      height: 90,
                    ),
                    const SizedBox(width: 8),

                    // 2. Belon Kata + Animasi
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.85),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                          boxShadow: const [
                            BoxShadow(color: Colors.black12, blurRadius: 3),
                          ],
                        ),
                        child: DefaultTextStyle(
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            fontStyle: FontStyle.italic,
                            height: 1.3,
                          ),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(
                                widget
                                    .ustazahMessage, // ✅ Ambil mesej ikut topik
                                speed: const Duration(
                                  milliseconds: 80,
                                ), // Kelajuan taip
                                cursor: '|', // Tanda kursor menaip
                              ),
                            ],
                            totalRepeatCount: 1, // Taip sekali je
                            displayFullTextOnTap:
                                true, // Tekan skrin terus habis tulis
                            isRepeatingAnimation: false,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ✅ TAMAT BAHAGIAN USTAZAH
              const SizedBox(height: 50), // Jarak bawah skrin
            ],
          ),
        ),
      ),
    );
  }

  // ✅ FUNGSI BINA GAMBAR (DIBETULKAN: MUAT SEMPURNA TANPA TERPOTONG)
  Widget _buildImageWidget(String imagePath) {
    return InteractiveViewer(
      panEnabled: true,
      minScale: 1.0,
      maxScale: 4.0, // Masih boleh zum kalau nak tengok detail
      child: Center(
        child: Image.asset(
          imagePath,
          fit: BoxFit
              .contain, // ✅ YANG PENTING: GUNA INI! Gambar nampak penuh semua, tak potong
          width: double.infinity, // ✅ Penuh lebar kotak
          // height: double.infinity, -> Tak perlu dah bila guna contain
          errorBuilder: (context, error, stackTrace) {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.broken_image, size: 50, color: Colors.grey),
                SizedBox(height: 10),
                Text(
                  "Gambar tidak dijumpai",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
