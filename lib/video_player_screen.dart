import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'background_screen.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String title;
  final String videoPath;
  final String imagePath;
  final String description;
  final bool isVideo;

  const VideoPlayerScreen({
    super.key,
    required this.title,
    required this.videoPath,
    required this.imagePath,
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
    // ✅ KITA GUNA BACKGROUNDSCREEN SEBAGAI "RUMAH" PALING LUAR
    return BackgroundWrapper(
      child: Scaffold(
        // Kita buat Scaffold ni lutsinar supaya bunga kat BackgroundScreen nampak
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
              // 🎥 VIDEO AREA
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
                            // ... (Button Play/Pause & Progress Bar kekal sama)
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
              // 🖼️ INFOGRAPHIC AREA
              else
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  height: 380,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 6),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: InteractiveViewer(
                      child: Center(
                        child: Image.asset(
                          widget.imagePath,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
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
                    color: Colors.white.withOpacity(
                      0.6,
                    ), // Teks nampak atas bunga
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
              const SizedBox(height: 50), // Jarak bawah supaya tak rapat sangat
            ],
          ),
        ),
      ),
    );
  }
}
