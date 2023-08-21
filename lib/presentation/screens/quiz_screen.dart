import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igbo_lang_tutor/core/constants.dart';
import 'package:igbo_lang_tutor/presentation/screens/questions_screen.dart';

import '../../data/models/video.dart';
import '../../domain/business_logic/blocs/video/video_bloc.dart';
import '../../domain/business_logic/blocs/video/video_state.dart';
import '../widgets/lecture_tile.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({
    super.key,
  });

  @override
  State<QuizScreen> createState() => _QuizState();
}

class _QuizState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Choose a category to test your knowledge!',
              style:
                  GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 25,
            ),
            BlocBuilder<VideoBloc, VideoState>(
              builder: (context, state) {
                List<Video> _lectures = [];
                final colors = [
                  Color(0XFFF4784E),
                  Color(0XFF7593E9),
                  Color(0XFFF5E24B),
                  Color(0XFF979AC6),
                  Color(0XFFA179DC),
                  Color(0XFFF4784E),
                  Color(0XFFF5E24B),
                ];
                final secondColors = [
                  Color(0XFFEC4812),
                  Color(0XFF3765EC),
                  Color(0XFFF2D701),
                  Color(0XFF777BB3),
                  Color(0XFFA179DC).withBlue(250),
                  Color(0XFFEC4812),
                  Color(0XFFF2D701),
                ];
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
                    ),
                  );
                }
                _lectures.addAll(state.videos);
                return _lectures.length > 0
                    ? Expanded(
                        child: GridView.builder(
                          itemCount: categories.length,
                          itemBuilder: (context, index) => LectureTile(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => QuestionsScreen(
                                    category: categories[index],
                                    fromLecture: false,
                                  ),
                                ),
                              );
                            },
                            text: categories[index],
                            color: colors[index],
                            secondColor: secondColors[index],
                            numberOfCourses: _lectures
                                .where((lecture) =>
                                    lecture.category == categories[index])
                                .length,
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 5 / 3.5,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                        ),
                      )
                    : const Center(
                        child: Text(
                            'Could not load your courses. Check your network connection!'),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
