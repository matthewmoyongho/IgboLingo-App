import 'package:flutter/material.dart';
import 'package:igbo_lang_tutor/core/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kPrimaryColor,
        child: const Center(
          child: Image(image: AssetImage('assets/launch_icon.png')),
        ),
      ),
    );
  }
}
