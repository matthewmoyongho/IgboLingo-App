import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igbo_lang_tutor/core/constants.dart';
import 'package:igbo_lang_tutor/presentation/screens/questions_screen.dart';

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
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => QuestionsScreen())),
              child: Container(
                height: 50,
                width: double.infinity,
                color: kPrimaryColor,
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 5 / 3.5,
                children: [
                  LectureTile(
                    text: 'Greetings',
                    color: Color(0XFFF4784E),
                    secondColor: Color(0XFFEC4812),
                    numberOfCourses: 1,
                  ),
                  LectureTile(
                    text: 'Counting',
                    color: Color(0XFF7593E9),
                    secondColor: Color(0XFF3765EC),
                    numberOfCourses: 1,
                  ),
                  LectureTile(
                    text: 'Names',
                    color: Color(0XFFF5E24B),
                    secondColor: Color(0XFFF2D701),
                    numberOfCourses: 1,
                  ),
                  LectureTile(
                    text: 'Simple Sentences',
                    color: Color(0XFF979AC6),
                    secondColor: Color(0XFF777BB3),
                    numberOfCourses: 1,
                  ),
                  LectureTile(
                    text: 'Greetings',
                    color: Color(0XFFA179DC),
                    secondColor: Color(0XFFA179DC).withBlue(250),
                    numberOfCourses: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
