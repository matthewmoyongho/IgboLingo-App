import 'package:flutter/material.dart';
import 'package:igbo_lang_tutor/presentation/widgets/question.dart';

import '../../core/constants.dart';
import 'option_tile.dart';

class Quiz extends StatelessWidget {
  List<Map<String, Object>> questions;
  int questionIndex;
  void Function(int) onPressed;
  Quiz({
    required this.onPressed,
    required this.questions,
    required this.questionIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            // "Some text will go in here and will serve as the question for the number?"
            Question(
                questionText: questions[questionIndex]['question'].toString()),
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
                  '${questionIndex + 1}',
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
                child: const Text(
                  'Skip',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: (questions[questionIndex]['answer']
                        as List<Map<String, Object>>)
                    .map((option) {
                  return Column(
                    children: [
                      OptionsTile(
                        optionText: (option['aT']).toString(),
                        onPressed: () => onPressed(
                          int.parse(
                            option['aV'].toString(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                }).toList(),
                // OptionsTile(
                //   optionText: 'The options goes here!',
                //   onPressed: () {},
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                // OptionsTile(
                //   optionText: 'The options goes here!',
                //   onPressed: () {},
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                // OptionsTile(
                //   optionText: 'The options goes here!',
                //   onPressed: () {},
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                // OptionsTile(
                //   optionText: 'The options goes here!',
                //   onPressed: () {},
                // ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
