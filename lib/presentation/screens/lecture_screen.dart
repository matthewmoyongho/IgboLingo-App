import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igbo_lang_tutor/presentation/widgets/video_info.dart';

import '../../core/constants.dart';
import '../../data/models/video.dart';
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
                  List<Video> videos = [];
                  final categories = [
                    'Greetings and Introductions',
                    'Counting',
                    'Alphabets',
                    'Basic Vocabulary',
                    'Basic Phrases',
                    'Common Expressions',
                    'Extras'
                  ];
                  if (state is VideosLoading) {
                    return const Expanded(
                        child: Center(
                      child: CircularProgressIndicator(),
                    ));
                  }
                  videos.addAll(state.videos);
                  return ListView(
                    children: [
                      ...List.generate(
                          categories.length,
                          (index) => LectureListTile(
                                category: categories[index],
                                numberOfCourses: videos
                                    .where((video) =>
                                        video.category == categories[index])
                                    .length,
                                rating: 4.5,
                              )),
                    ],
                  );
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
  String category;
  int numberOfCourses;
  double rating;

  LectureListTile({
    super.key,
    required this.category,
    required this.numberOfCourses,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          borderRadius: BorderRadius.circular(20),
          elevation: 4,
          child: ListTile(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => VideoInfo(category: category),
              ),
            ),
            contentPadding:
                const EdgeInsets.only(top: 10, left: 10, bottom: 10, right: 30),
            leading: const Text('\u{1F3AC}',
                style: TextStyle(fontSize: 40, color: Colors.blue)),
            title: Text(
              category,
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
                    Text(
                        '$numberOfCourses ${numberOfCourses > 1 ? ' courses' : ' course'}'),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text('$rating'),
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
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
