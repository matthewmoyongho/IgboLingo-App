import 'package:flutter/material.dart';
import 'package:igbo_lang_tutor/core/constants.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  void Function(int index) onTap;
  int currentIndex;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          backgroundColor: Color(0XFF1B2A47),
          icon: Icon(
            Icons.home,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          backgroundColor: Color(0XFF1B2A47),
          icon: Icon(
            Icons.account_circle,
          ),
          label: 'Lecture',
        ),
        BottomNavigationBarItem(
          backgroundColor: Color(0XFF1B2A47),
          icon: Icon(
            Icons.favorite_border,
          ),
          label: 'Quiz',
        ),
        BottomNavigationBarItem(
          backgroundColor: kSecondaryColor,
          icon: Icon(
            Icons.settings,
          ),
          label: 'Profile',
        ),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: widget.currentIndex,
      backgroundColor: kSecondaryColor,
      selectedItemColor: kPrimaryColor,
      unselectedItemColor: kPrimaryColor,
      selectedLabelStyle: const TextStyle(color: kSecondaryColor),
      unselectedLabelStyle: const TextStyle(color: kSecondaryColor),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedFontSize: 14,
      unselectedFontSize: 14,
      selectedIconTheme: const IconThemeData(color: Color(0XFFFFB60A)),
      unselectedIconTheme: const IconThemeData(color: Color(0XFF8C94A7)),
      elevation: 0,
      iconSize: 20,
      onTap: widget.onTap,
      //     (val) {
      //   setState(() {
      //     widget.currentIndex = val;
      //   });
      // },
    );
    ;
  }
}
