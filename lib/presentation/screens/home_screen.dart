import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igbo_lang_tutor/core/constants.dart';
import 'package:igbo_lang_tutor/data/models/video.dart';

import '../../domain/business_logic/blocs/video/video_bloc.dart';
import '../../domain/business_logic/blocs/video/video_state.dart';
import '../widgets/lecture_tile.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({required this.startLearning, required this.logout});
  void Function() startLearning;
  void Function() logout;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Home',
                  style: GoogleFonts.roboto(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
                IconButton(onPressed: logout, icon: Icon(Icons.logout))
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Good day!',
                      style: GoogleFonts.roboto(
                          fontSize: 16,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'User',
                      style: GoogleFonts.roboto(
                          fontSize: 30,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                Container(
                  height: 70,
                  width: 50,
                  child: const Image(image: AssetImage('assets/avatar.png')),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: startLearning,
              child: Container(
                padding: const EdgeInsets.only(top: 15, left: 15),
                height: 170,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(25),
                    image: const DecorationImage(
                        image: AssetImage('assets/banner.png'),
                        fit: BoxFit.cover)),
                child: Text(
                  'Learn Igbo language in an exciting and fun way.',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Lectures',
                  style: GoogleFonts.roboto(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
                TextButton(
                  onPressed: startLearning,
                  style: ElevatedButton.styleFrom(
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.only(bottom: 0)),
                  child: Text(
                    'Start learning>>',
                    style: GoogleFonts.roboto(
                        color: Colors.orange, fontWeight: FontWeight.w500),
                  ),
                )
              ],
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
                  return const Expanded(child: Center(child: CircularProgressIndicator(),),);
                }
                _lectures.addAll(state.videos);
                return _lectures.length > 0
                    ? Expanded(
                        child: GridView.builder(
                          itemCount: categories.length,
                          itemBuilder: (context, index) => LectureTile(
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
