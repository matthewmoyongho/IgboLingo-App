import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LectureTile extends StatelessWidget {
  LectureTile({
    super.key,
    required this.text,
    required this.color,
    required this.numberOfCourses,
    required this.secondColor,
  });

  String text;
  Color color;
  int numberOfCourses;
  Color secondColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 186,
      width: 110,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 15, left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text.toUpperCase(),
              style: GoogleFonts.poppins(
                color: Color(0XFF000000),
                fontSize: 18,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: secondColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                    ),
                  ),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    '$numberOfCourses ${numberOfCourses > 1 ? 'lectures' : 'lecture'} ',
                    style: GoogleFonts.poppins(
                      color: const Color(0XFF000000),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
