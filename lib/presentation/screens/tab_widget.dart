import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:igbo_lang_tutor/core/constants.dart';
import 'package:igbo_lang_tutor/domain/business_logic/blocs/authentication/authentication_bloc.dart';
import 'package:igbo_lang_tutor/domain/business_logic/blocs/authentication/authentication_event.dart';
import 'package:igbo_lang_tutor/presentation/screens/home_screen.dart';
import 'package:igbo_lang_tutor/presentation/screens/profile.dart';
import 'package:igbo_lang_tutor/presentation/screens/quiz_screen.dart';
import 'package:igbo_lang_tutor/presentation/widgets/bottom_nav_bar.dart';

import './lecture_screen.dart';
import '../../domain/business_logic/blocs/authentication/authentication_state.dart';

class TabWidget extends StatefulWidget {
  const TabWidget({super.key, required this.title});

  final String title;

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  int _navIndex = 0;

  void _incrementCounter() {
    context.read<AuthenticationBloc>().add(LogoutRequest());
  }

  void _ontap(int index) {
    setState(() {
      _navIndex = index;
    });
  }

  List tabScreens = [const HomeScreen(), LectureScreen(), QuizScreen(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: tabScreens[_navIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _navIndex,
        onTap: _ontap,
      ),
      //, onTap: _ontap),
      floatingActionButton:
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          return FloatingActionButton(onPressed: () {
            context.read<AuthenticationBloc>().add(LogoutRequest());
          });
        },
      ),
    );
  }
}
