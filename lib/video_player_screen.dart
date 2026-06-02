import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'background_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:audioplayers/audioplayers.dart';

class VideoPlayerScreen extends StatefulWidget {
  final dynamic imagePaths;
  final String title;
  final String videoPath;
  final String description;
  final bool isVideo;
  final bool isAudio;
  final List<dynamic>? senaraiDoa;
  final String ustazahMessage;

  const VideoPlayerScreen({
    super.key,
    required this.title,
    required this.videoPath,
    required this.imagePaths,
    required this.description,
    this.isVideo = false,
    this.isAudio = false,
    this.senaraiDoa,
    this.ustazahMessage = "",
  });

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController? _controller;
  bool _isVideoReady = false;

  final AudioPlayer _audioPlayer = AudioPlayer();
  String? _sedangMainAudio;

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
      final kedudukan = _controller!.value.position;
      _controller!.seekTo(kedudukan + Duration(seconds: seconds));
    }
  }

  Future<void> _mainHentiAudio(String failAudio) async {
    if (_sedangMainAudio == failAudio) {
      await _audioPlayer.stop();
      setState(() => _sedangMainAudio = null);
    } else {
      await _audioPlayer.stop();
      await _audioPlayer.play(AssetSource(failAudio));
      setState(() => _sedangMainAudio = failAudio);

      _audioPlayer.onPlayerComplete.listen((event) {
        setState(() => _sedangMainAudio = null);
      });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    _audioPlayer.dispose();
    _pageController.dispose();
    super.dispose();
  }

  int _getImageCount() {
    if (widget.imagePaths is String) return 1;
    if (widget.imagePaths is List) return widget.imagePaths.length;
    return 0;
  }

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
              //VIDEO
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
                                  icon: const Icon(
                                    Icons.replay_10,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  onPressed: () => _skip(-10),
                                ),
                                IconButton(
                                  icon: Icon(
                                    _controller!.value.isPlaying
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                    color: Colors.white,
                                    size: 40,
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
                                    Icons.forward_10,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  onPressed: () => _skip(10),
                                ),
                              ],
                            ),
                            Padding(
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
              //INFOGRAFIK
              else if (!widget.isVideo && !widget.isAudio)
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
                        child: _getImageCount() > 1
                            ? PageView(
                                controller: _pageController,
                                onPageChanged: (i) =>
                                    setState(() => _currentPage = i),
                                children: List.generate(
                                  _getImageCount(),
                                  (i) => _buildImageWidget(_getImageAt(i)),
                                ),
                              )
                            : _buildImageWidget(_getImageAt(0)),
                      ),
                    ),
                    if (_getImageCount() > 1)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          _getImageCount(),
                          (i) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: _currentPage == i ? 12 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: _currentPage == i
                                  ? Colors.pink
                                  : Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                    const SizedBox(height: 10),
                  ],
                ),

              //DOA & ZIKIR
              if (widget.isAudio && widget.senaraiDoa != null)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Column(
                    children: widget.senaraiDoa!.map((doa) {
                      final sedangMain = (_sedangMainAudio == doa['audio']);
                      return Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(color: Colors.pink.shade100),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    doa['nama'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.pink,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () =>
                                      _mainHentiAudio(doa['audio']),
                                  icon: Icon(
                                    sedangMain
                                        ? Icons.volume_off
                                        : Icons.volume_up,
                                    color: sedangMain
                                        ? Colors.red
                                        : Colors.pink,
                                    size: 28,
                                  ),
                                ),
                              ],
                            ),
                            const Divider(height: 5),

                            Text(
                              doa['arab'],
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                fontSize: 22,
                                height: 1.6,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),

                            Text(
                              doa['rumi'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                fontStyle: FontStyle.italic,
                                color: Colors.grey.shade700,
                              ),
                            ),
                            const SizedBox(height: 10),

                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.pink.shade50,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                doa['maksud'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 13,
                                  height: 1.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),

              //PENERANGAN BIASA
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

              //USTAZAH
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/images/ustazah1.png',
                      width: 90,
                      height: 90,
                    ),
                    const SizedBox(width: 8),
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
                                widget.ustazahMessage,
                                speed: const Duration(milliseconds: 80),
                                cursor: '|',
                              ),
                            ],
                            totalRepeatCount: 1,
                            displayFullTextOnTap: true,
                            isRepeatingAnimation: false,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageWidget(String imagePath) {
    return InteractiveViewer(
      panEnabled: true,
      minScale: 1.0,
      maxScale: 4.0,
      child: Center(
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain,
          width: double.infinity,
          errorBuilder: (_, __, ___) => const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.broken_image, size: 50, color: Colors.grey),
              Text("Gambar tiada", style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
