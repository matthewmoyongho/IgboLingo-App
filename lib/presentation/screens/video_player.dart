import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

class VideoScreen extends StatefulWidget {
  final Video video;
  final VideoPlayerController videoPlayerController;

  VideoScreen({required this.video, required this.videoPlayerController});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late ChewieController _videoController;
  final asset = 'assets/video.mp4';

  @override
  void initState() {
    super.initState();
    _videoController = ChewieController(
        looping: true,
        autoPlay: true,
        videoPlayerController: VideoPlayerController.networkUrl(
          Uri.parse(widget.video.mediaUrl),
        )
        // ..setLooping(true)
        // ..initialize().then((value) => VideoPlayerController),
        // autoPlay: true,
        // looping: true,
        );
  }

  @override
  void dispose() {
    super.dispose();
    _videoController.dispose();
    widget.videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      //kSecondaryColor,
      appBar: AppBar(
        title: Text(widget.video.name),
        backgroundColor: Colors.black45,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Chewie(
                controller: _videoController,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                widget.video.description,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// In your main app:
// void main() {
//   runApp(MaterialApp(
//     home: VideoScreen(
//       video: Video(
//         name: 'Sample Video',
//         description: 'A demo video for illustration.',
//         mediaUrl: 'YOUR_VIDEO_URL_FROM_FIRESTORE',
//       ),
//     ),
//   ));
// }
