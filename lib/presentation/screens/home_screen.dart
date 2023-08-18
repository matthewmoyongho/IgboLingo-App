import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igbo_lang_tutor/core/constants.dart';
import 'package:igbo_lang_tutor/domain/business_logic/blocs/authentication/authentication_bloc.dart';
import 'package:igbo_lang_tutor/domain/business_logic/blocs/authentication/authentication_event.dart';
import 'package:igbo_lang_tutor/presentation/screens/lecture_screen.dart';

import '../widgets/lecture_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  int _navIndex = 0;

  void _incrementCounter() {
    context.read<AuthenticationBloc>().add(LogoutRequest());
  }

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
            Text(
              'Home',
              style:
                  GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w500),
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
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => LectureScreen(),
                ),
              ),
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
              height: 20,
            ),
            Text(
              'Lectures',
              style:
                  GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w500),
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
      // bottomNavigationBar: BottomNavBar(
      //   currentIndex: _navIndex,
      // ),
    );
  }
}
