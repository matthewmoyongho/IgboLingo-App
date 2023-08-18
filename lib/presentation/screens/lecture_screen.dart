import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igbo_lang_tutor/presentation/screens/video_player.dart';

import '../../core/constants.dart';
import '../../domain/business_logic/blocs/video/video_bloc.dart';
import '../../domain/business_logic/blocs/video/video_state.dart';

class LectureScreen extends StatelessWidget {
  const LectureScreen({super.key});

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
            Expanded(
              child: BlocBuilder<VideoBloc, VideoState>(
                builder: (context, state) {
                  return ListView(
                    children: const [
                      LectureListTile(),
                      SizedBox(
                        height: 10,
                      ),
                      LectureListTile(),
                      SizedBox(
                        height: 10,
                      ),
                      LectureListTile(),
                      SizedBox(
                        height: 10,
                      ),
                      LectureListTile(),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  );

                  // if (state is VideosLoading) {
                  //   return const Center(
                  //     child: CircularProgressIndicator(),
                  //   );
                  // }

                  // return Column(
                  //     children: List.generate(state.videos.length, (index) {
                  //   final video = state.videos[index];
                  //   return Material(
                  //     borderRadius: BorderRadius.circular(5),
                  //     elevation: 2,
                  //     child: ListTile(
                  //       onTap: () => Navigator.of(context).push(
                  //         MaterialPageRoute(
                  //           builder: (context) => const LectureDetailScreen(),
                  //         ),
                  //       ),
                  //       leading: const Text('\u{1F3AC}',
                  //           style:
                  //               TextStyle(fontSize: 40, color: Colors.blue)),
                  //       title: Text(
                  //         video.name,
                  //         style:
                  //             GoogleFonts.roboto(fontWeight: FontWeight.bold),
                  //       ),
                  //       subtitle: Text(
                  //           '${video.description.substring(0, video.description.length < 50 ? video.description.length : 50)}...'),
                  //     ),
                  //   );
                  // }));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LectureListTile extends StatelessWidget {
  const LectureListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      elevation: 4,
      child: ListTile(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => VideoScreen(),
          ),
        ),
        contentPadding:
            const EdgeInsets.only(top: 10, left: 10, bottom: 10, right: 30),
        leading: const Text('\u{1F3AC}',
            style: TextStyle(fontSize: 40, color: Colors.blue)),
        title: Text(
          'Greeting',
          style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text('24 lectures'),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('4.5'),
                  ],
                )
              ],
            ),
            const Icon(
              Icons.favorite,
              color: kPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
