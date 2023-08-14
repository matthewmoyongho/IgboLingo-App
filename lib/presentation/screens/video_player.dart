import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../data/models/video.dart';

// class VideoItem {
//   final String title;
//   final String description;
//   final String videoUrl;
//
//   VideoItem(
//       {required this.title, required this.description, required this.videoUrl});
// }

class VideoScreen extends StatelessWidget {
  final Video video;

  VideoScreen({required this.video});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(video.name)),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: VideoPlayer(
              VideoPlayerController.networkUrl(Uri.parse(video.mediaUrl)),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(video.description),
          ),
        ],
      ),
    );
  }
}

// In your main app:
void main() {
  runApp(MaterialApp(
    home: VideoScreen(
      video: Video(
        name: 'Sample Video',
        description: 'A demo video for illustration.',
        mediaUrl: 'YOUR_VIDEO_URL_FROM_FIRESTORE',
      ),
    ),
  ));
}
