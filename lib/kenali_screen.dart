import 'package:flutter/material.dart';
// import 'video_player_screen.dart'; // You'll create this for your videos

class KenaliScreen extends StatelessWidget {
  const KenaliScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFFCE4EC,
      ), // Match the light pink in your image
      appBar: AppBar(
        title: const Text("Kenali Haid Anda"),
        backgroundColor: Colors.pink,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(15),
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        children: [
          _buildTopicCard(
            context,
            "Emosi ketika haid",
            "assets/images/emotion.png",
            false,
          ),
          _buildTopicCard(
            context,
            "Apa itu kitaran haid",
            "assets/videos/cycle_video.mp4",
            true,
          ), // Video
          _buildTopicCard(
            context,
            "Jenis produk haid",
            "assets/images/products.png",
            false,
          ),
          _buildTopicCard(
            context,
            "Kebersihan semasa haid",
            "assets/images/hygiene.png",
            false,
          ),
          _buildTopicCard(
            context,
            "Makanan patut/tidak patut",
            "assets/images/food.png",
            false,
          ),
          _buildTopicCard(
            context,
            "Penjagaan haid",
            "assets/videos/care_video.mp4",
            true,
          ), // Video
        ],
      ),
    );
  }

  Widget _buildTopicCard(
    BuildContext context,
    String title,
    String path,
    bool isVideo,
  ) {
    return GestureDetector(
      onTap: () {
        // Add your logic here to open the Image or Video Player
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(path),
            ), // Use a placeholder if it's a video
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
