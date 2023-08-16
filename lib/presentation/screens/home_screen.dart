import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igbo_lang_tutor/core/constants.dart';
import 'package:igbo_lang_tutor/domain/business_logic/blocs/authentication/authentication_bloc.dart';
import 'package:igbo_lang_tutor/domain/business_logic/blocs/authentication/authentication_event.dart';

import './lecture_screen.dart';

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
          //mainAxisAlignment: MainAxisAlignment.center,
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
            Text(
              'Hello!',
              style: GoogleFonts.roboto(
                  fontSize: 30, letterSpacing: 2, fontWeight: FontWeight.w700),
            ),
            Text(
              'User',
              style: GoogleFonts.roboto(
                  fontSize: 30, letterSpacing: 2, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 150,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(25)),
              child: const Text(
                'click here to navigate',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
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
                height: 50,
                width: double.infinity,
                color: Colors.red,
                alignment: Alignment.center,
                child: const Text(
                  'click here to navigate',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            const Text(
              'You have pushed the button this many times:',
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
