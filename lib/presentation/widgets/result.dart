import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants.dart';

class Result extends StatelessWidget {
  void Function() reset;
  final int result;
  bool passed;
  Result(this.result, this.reset, this.passed);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //SizedBox(height: MediaQuery.of(context).size.height * .2),
          Image(
            image: AssetImage('assets/congrats.png'),
          ),
          const Text(
            "You have finished your quiz!",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "You answered $result questions correctly",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.w400),
          ),
          // if (!passed)
          //   const SizedBox(
          //     height: 20,
          //   ),
          // if (!passed)
          //   const Text(
          //     "You need to answer all questions correctly to unlock the next topic",
          //     textAlign: TextAlign.center,
          //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          //   ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: reset,
                style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    fixedSize:
                        Size(MediaQuery.of(context).size.width * .35, 45)),
                child: const Text("Restart Quiz"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    fixedSize:
                        Size(MediaQuery.of(context).size.width * .35, 45)),
                child: const Text("Finish"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
