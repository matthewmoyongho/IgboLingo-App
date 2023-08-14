import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:igbo_lang_tutor/domain/business_logic/blocs/video/video_bloc.dart';
import 'package:igbo_lang_tutor/domain/business_logic/blocs/video/video_event.dart';
import 'package:igbo_lang_tutor/domain/business_logic/blocs/video/video_state.dart';

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
              title: Text(video.name),
              subtitle: Text(video.description),
            );
          }));
        },
      ),
    );
  }
}
