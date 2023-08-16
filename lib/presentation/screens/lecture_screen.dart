import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
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
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 15, left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Lecture',
              style:
                  GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 25,
            ),
            BlocBuilder<VideoBloc, VideoState>(
              builder: (context, state) {
                if (state is VideosLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return Column(
                    children: List.generate(state.videos.length, (index) {
                  final video = state.videos[index];
                  return Material(
                    borderRadius: BorderRadius.circular(5),
                    elevation: 2,
                    child: ListTile(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => VideoScreen(
                            video: video,
                            videoPlayerController:
                                VideoPlayerController.asset('assets/video.mp4'),
                          ),
                        ),
                      ),
                      leading: const Text('\u{1F3AC}',
                          style: TextStyle(fontSize: 40, color: Colors.blue)),
                      title: Text(
                        video.name,
                        style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                          '${video.description.substring(0, video.description.length < 50 ? video.description.length : 50)}...'),
                    ),
                  );
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
