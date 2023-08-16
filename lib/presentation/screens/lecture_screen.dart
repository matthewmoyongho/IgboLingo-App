import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:igbo_lang_tutor/domain/business_logic/blocs/video/video_bloc.dart';
import 'package:igbo_lang_tutor/domain/business_logic/blocs/video/video_event.dart';
import 'package:igbo_lang_tutor/domain/business_logic/blocs/video/video_state.dart';
import 'package:igbo_lang_tutor/presentation/screens/video_player.dart';
import 'package:video_player/video_player.dart';

class LectureScreen extends StatefulWidget {
  const LectureScreen({Key? key}) : super(key: key);

  @override
  State<LectureScreen> createState() => _LectureScreenState();
}

class _LectureScreenState extends State<LectureScreen> {
  @override
  void initState() {
    super.initState();
    context.read<VideoBloc>().add(LoadVideos());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Lecture'),
      ),
      body: BlocBuilder<VideoBloc, VideoState>(
        builder: (context, state) {
          if (state is VideosLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Column(
              children: List.generate(state.videos.length, (index) {
            final video = state.videos[index];
            return ListTile(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => VideoScreen(
                        video: video,
                        videoPlayerController:
                            VideoPlayerController.asset('assets/video.mp4'),
                      ))),
              title: Text(video.name),
              subtitle: Text(video.description),
            );
          }));
        },
      ),
    );
  }
}
