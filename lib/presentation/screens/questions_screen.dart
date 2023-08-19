import 'package:flutter/material.dart';
import 'package:igbo_lang_tutor/core/constants.dart';
import 'package:igbo_lang_tutor/presentation/widgets/result.dart';

import '../widgets/quiz.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int _questionIndex = 0;
  int _totalScore = 0;

  void _optionPressed(int score) {
    setState(() {
      _questionIndex++;
      _totalScore += score;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: _questionIndex < kQuestions.length
            ? Quiz(
                questions: kQuestions,
                questionIndex: _questionIndex,
                onPressed: _optionPressed,
              )
            : Result(_totalScore, () => _resetQuiz(),
                _totalScore == kQuestions.length),
      ),
    );
  }
}
