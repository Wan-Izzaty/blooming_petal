import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

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
    return Scaffold(
      backgroundColor: const Color(0xFFFFE6EE),
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
                          child: CircularProgressIndicator(color: Colors.pink),
                        ),
                      ),
              )
            // 🖼️ INFOGRAPHIC AREA (FIXED)
            else
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                height: 380,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 6),
                  ],
                ),
                // ClipRRect keeps the image corners rounded matching the container
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: InteractiveViewer(
                    panEnabled: true,
                    minScale: 1.0,
                    maxScale: 4.0, // Allows users to zoom in up to 4x
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(
                          12.0,
                        ), // Adds a clean inner border
                        child: Image.asset(
                          widget.imagePath,
                          fit: BoxFit
                              .contain, // 👈 Ensures the image shrinks neatly inside the 380 height
                          errorBuilder: (context, error, stackTrace) {
                            return const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.broken_image,
                                  size: 50,
                                  color: Colors.grey,
                                ),
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
                    ),
                  ),
                ),
              ),

            // 📖 DESCRIPTION TEXT
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
          ],
        ),
      ),
    );
  }
}
