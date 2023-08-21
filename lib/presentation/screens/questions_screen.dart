import 'package:flutter/material.dart';
import 'package:igbo_lang_tutor/core/constants.dart';
import 'package:igbo_lang_tutor/presentation/widgets/result.dart';

import '../widgets/quiz.dart';

class QuestionsScreen extends StatefulWidget {
  QuestionsScreen(
      {Key? key, required this.fromLecture, required this.category, this.index})
      : super(key: key);
  String category;
  bool fromLecture;
  int? index;
  //List<Map<String, Object>> questions;
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

  final categories = [
    'Greetings and Introductions',
    'Counting',
    'Alphabets',
    'Basic Vocabulary',
    'Basic Phrases',
    'Common Expressions',
    'Extras'
  ];
  late List<Map<String, Object>> list;

  getQuestionList() {
    switch (widget.category) {
      case "Greetings and Introductions":
        list = kGreetingsAndIntroduction;
        break;
      case "Counting":
        list = kNumbersAndCounting;
        break;
      case "Alphabets":
        list = kBasicVocabulary;
        break;
      case "Basic Vocabulary":
        list = kBasicVocabulary;
        break;
      case "Basic Phrases":
        list = kBasicPhrasesAndQuestions;
        break;
      case "Common Expressions":
        list = kDaysMonthsSeasons;
        break;
      case "Extras":
        list = kBasicPhrasesAndQuestions;
        break;
      default:
        list = [];
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    getQuestionList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: _questionIndex < list.length
            ? Quiz(
                questions: list,
                questionIndex: _questionIndex,
                onPressed: _optionPressed,
              )
            : Result(
                index: widget.index!,
                result: _totalScore,
                reset: () => _resetQuiz(),
                passed: _totalScore == list.length,
                fromLecture: widget.fromLecture,
              ),
      ),
    );
  }
}
