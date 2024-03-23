import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igbo_lang_tutor/core/constants.dart';
import 'package:video_player/video_player.dart';

import '../../data/models/video.dart';
import '../../domain/business_logic/blocs/video/video_bloc.dart';
import '../../domain/business_logic/blocs/video/video_state.dart';

class VideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        title: Text('Enjoy your lectures'),
        backgroundColor: Colors.black45,
        elevation: 0,
      ),
      body: Center(
        child: BlocBuilder<VideoBloc, VideoState>(
          builder: (context, state) {
            // context.read<VideoBloc>().add(LoadVideos());
            if (state.videos.isEmpty) {
              return const Center(
                child: Text(
                  'List is empty!',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
            //List lectures= state.videos.where((element) => false)
            return ListView(
              children: List.generate(
                state.videos.length,
                (index) => VideoPlayerView(
                  video: state.videos[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class VideoPlayerView extends StatefulWidget {
  const VideoPlayerView({Key? key, required this.video}) : super(key: key);
  final Video video;

  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(widget.video.mediaUrl),
    );
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16 / 9,
      looping: true,
      showControls: true,
    );
  }

  @override
  void dispose() {
    _chewieController.dispose();
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(
            color: Colors.white,
          ),
          Text(widget.video.name,
              style: GoogleFonts.poppins(
                color: kSecondaryColor,
                fontSize: 18,
              )),
          AspectRatio(
              aspectRatio: 16 / 9,
              child: Chewie(controller: _chewieController)),
          const Divider(
            color: Colors.white,
          ),
          Text(
            widget.video.description,
            style: GoogleFonts.poppins(
              color: kSecondaryColor,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
