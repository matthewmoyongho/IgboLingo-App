import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igbo_lang_tutor/core/constants.dart';

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
            Container(
              child: Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: [
                    LectureTile(
                      text: 'Greetings',
                      color: kPrimaryColor,
                    ),
                    LectureTile(
                      text: 'Counting',
                      color: kPrimaryColor,
                    ),
                    LectureTile(
                      text: 'Names',
                      color: kPrimaryColor,
                    ),
                    LectureTile(
                      text: 'Simple Sentences',
                      color: kPrimaryColor,
                    ),
                    LectureTile(
                      text: 'Greetings',
                      color: kPrimaryColor,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LectureTile extends StatelessWidget {
  LectureTile({
    super.key,
    required this.text,
    required this.color,
  });

  String text;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 186,
      width: 110,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: GoogleFonts.roboto(color: kSecondaryColor, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
