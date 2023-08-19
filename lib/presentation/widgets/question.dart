import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants.dart';

class Question extends StatelessWidget {
  Question({
    required this.questionText,
    super.key,
  });

  String questionText;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      height: MediaQuery.of(context).size.height * 0.3,
      width: double.infinity,
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
          questionText,
          style: GoogleFonts.poppins(color: kSecondaryColor, fontSize: 16),
        ),
      ),
    );
  }
}
