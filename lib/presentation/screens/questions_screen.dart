import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igbo_lang_tutor/core/constants.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: const BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(80),
                      bottomRight: Radius.circular(80),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 30, 15, 15),
                    child: Text(
                      "Some text will go in here and will serve as the question for the number?",
                      style: GoogleFonts.poppins(
                          color: kSecondaryColor, fontSize: 16),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -25,
                  // right: 0,
                  // left: 0,
                  child: Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.grey, width: 2),
                      color: kSecondaryColor,
                    ),
                    child: Text(
                      '1',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 60,
                  right: 25,
                  // left: 0,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: kPrimaryColor,
                      backgroundColor: kSecondaryColor,
                    ),
                    child: Text(
                      'Next',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    OptionsTile(optionText: 'The options goes here!'),
                    SizedBox(
                      height: 20,
                    ),
                    OptionsTile(optionText: 'The options goes here!'),
                    SizedBox(
                      height: 20,
                    ),
                    OptionsTile(optionText: 'The options goes here!'),
                    SizedBox(
                      height: 20,
                    ),
                    OptionsTile(optionText: 'The options goes here!'),
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

class OptionsTile extends StatelessWidget {
  final String optionText;
  const OptionsTile({super.key, required this.optionText});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(50),
      elevation: 4,
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.08,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(optionText),
      ),
    );
  }
}
