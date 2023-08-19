import 'package:flutter/material.dart';

import '../../core/constants.dart';

class OptionsTile extends StatelessWidget {
  final void Function() onPressed;
  final String optionText;
  const OptionsTile(
      {super.key, required this.optionText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Material(
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
      ),
    );
  }
}
