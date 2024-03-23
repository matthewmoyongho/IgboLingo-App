import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:igbo_lang_tutor/core/constants.dart';
import 'package:igbo_lang_tutor/domain/business_logic/blocs/authentication/authentication_bloc.dart';
import 'package:igbo_lang_tutor/domain/business_logic/blocs/authentication/authentication_event.dart';
import 'package:igbo_lang_tutor/domain/business_logic/blocs/user/user_bloc.dart';
import 'package:igbo_lang_tutor/domain/business_logic/blocs/video/video_bloc.dart';
import 'package:igbo_lang_tutor/domain/business_logic/blocs/video/video_event.dart';
import 'package:igbo_lang_tutor/presentation/screens/home_screen.dart';
import 'package:igbo_lang_tutor/presentation/screens/profile.dart';
import 'package:igbo_lang_tutor/presentation/screens/quiz_screen.dart';
import 'package:igbo_lang_tutor/presentation/widgets/bottom_nav_bar.dart';

import '../../domain/business_logic/blocs/user/user_event.dart';
import './lecture_screen.dart';

class TabWidget extends StatefulWidget {
  const TabWidget({super.key, required this.title});

  final String title;

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  int _navIndex = 0;

  void _logout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('About to be logged out'),
        content: const Text('Would you like to proceed with logging out?'),
        actions: [
          TextButton(
            onPressed: () {
              context.read<AuthenticationBloc>().add(LogoutRequest());
              Navigator.of(context).pop();
            },
            child: Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('No'),
          ),
        ],
      ),
    );
  }

  void _ontap(int index) {
    setState(() {
      _navIndex = index;
    });
  }

  void _startLearning() {
    setState(() {
      _navIndex = 1;
    });
  }

  List tabScreens = [
    '//HomeScreen()',
    LectureScreen(),
    QuizScreen(),
    Profile(),
  ];

  @override
  void initState() {
    super.initState();
    context.read<VideoBloc>().add(LoadVideos());
    context
        .read<UserBloc>()
        .add(LoadUser(uid: FirebaseAuth.instance.currentUser!.uid));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: _navIndex == 0
          ? HomeScreen(
              startLearning: _startLearning,
              logout: _logout,
            )
          : tabScreens[_navIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _navIndex,
        onTap: _ontap,
      ),
    );
  }
}
