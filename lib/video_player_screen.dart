import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String title;
  final String videoPath;
  final String description;
  final bool isVideo;

  const VideoPlayerScreen({
    super.key,
    required this.title,
    required this.videoPath,
    required this.description,
    this.isVideo = false,
  });

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController? _controller;
  bool _isVideoReady = false;

  @override
  void initState() {
    super.initState();
    // Hanya buat controller JIKA isVideo = TRUE DAN path tak kosong
    if (widget.isVideo && widget.videoPath.isNotEmpty) {
      _controller = VideoPlayerController.asset(widget.videoPath)
        ..initialize().then((_) {
          setState(() {
            _isVideoReady = true;
          });
        });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE6EE),
      appBar: AppBar(title: Text(widget.title), backgroundColor: Colors.pink),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 🎥 BAHAGIAN VIDEO - HANYA MUNCUL JIKA ADA VIDEO
            if (widget.isVideo && _controller != null)
              Container(
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: _isVideoReady
                    ? Column(
                        children: [
                          AspectRatio(
                            aspectRatio: _controller!.value.aspectRatio,
                            child: VideoPlayer(_controller!),
                          ),

                          // 📉 BAHAGIAN YANG ERROR TADI - DAH DIPERBAIKI
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
                              Expanded(
                                child: VideoProgressIndicator(
                                  _controller!, // ✅ Sekarang selamat sebab dah cek _controller != null kat atas
                                  allowScrubbing: true,
                                  colors: const VideoProgressColors(
                                    playedColor: Colors.pink,
                                    backgroundColor: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // --- TAMAT ---
                        ],
                      )
                    : const SizedBox(
                        height: 200,
                        child: Center(
                          child: CircularProgressIndicator(color: Colors.pink),
                        ),
                      ),
              )
            // 🖼️ BAHAGIAN GAMBAR / TEMPAT KOSONG
            else
              Container(
                height: 180,
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(Icons.image, size: 80, color: Colors.pink),
              ),

            // 📖 TEKS PENERANGAN
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Text(
                widget.description,
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 16, height: 1.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
