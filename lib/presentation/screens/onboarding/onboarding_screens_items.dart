import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igbo_lang_tutor/core/constants.dart';
import 'package:igbo_lang_tutor/presentation/screens/sign_up.dart';

List<Map> kOnBoardingContents = [
  {
    'picture': 'assets/onboarding1.png',
    'title': 'Welcome to the Igbo Language Tutor!',
    'body':
        'Discover the rich culture and heritage of the Igbo people through interactive lessons and engaging activities.'
  },
  {
    'picture': 'assets/onboarding2.png',
    'title': 'Learn at Your Own Pace',
    'body':
        'Learn the Igbo language at your own pace with our mobile tutor designed specifically for secondary school students.'
  },
  {
    'picture': 'assets/onboarding3.png',
    'title': 'Track Progress and Unlock Achievements',
    'body':
        'Track your progress and earn achievements as you unlock new levels and master the Igbo language step by step.'
  },
];

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(),
        onPressed: () async {
          // final prefs = await SharedPreferences.getInstance();
          // prefs.setBool('showHome', true);
          // Navigator.of(context).pushReplacementNamed(kSignUpScreenRoute);
        },
        child: Text('Skip',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 12,
                color: kPrimaryColor,
                height: 2,
                letterSpacing: 2,
              ),
            )));
  }
}

Widget buildDots(BuildContext context, int onBoardingIndex, Color color) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(
      kOnBoardingContents.length,
      (index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: index == onBoardingIndex ? color : Colors.blueGrey,
              borderRadius: BorderRadius.circular(100)),
          height: 10,
          width: index == onBoardingIndex ? 15 : 10,
        ),
      ),
    ),
  );
}

ElevatedButton buildElevatedButton(
  Size deviceSize,
  int onboardingIndex,
  Function() callback,
  BuildContext context,
) {
  return ElevatedButton(
    onPressed: onboardingIndex + 1 < kOnBoardingContents.length
        ? callback
        : () async {
            // final prefs = await SharedPreferences.getInstance();
            //  prefs.setBool('showHome', true);
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => SignUp()));
          },
    style: ElevatedButton.styleFrom(
        primary: kPrimaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        fixedSize: Size(deviceSize.width, deviceSize.height * 0.035)),
    child: Text(
      onboardingIndex + 1 == kOnBoardingContents.length ? 'Continue' : 'Next',
      style: TextStyle(fontSize: 18),
    ),
  );
}
