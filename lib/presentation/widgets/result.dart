import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igbo_lang_tutor/domain/business_logic/blocs/user/user_bloc.dart';
import 'package:igbo_lang_tutor/domain/business_logic/blocs/user/user_event.dart';

import '../../core/constants.dart';
import '../../data/models/user.dart';
import '../../domain/business_logic/blocs/user/user_state.dart';

class Result extends StatelessWidget {
  void Function() reset;
  final int result;
  bool passed;
  bool fromLecture;
  int index;
  Result(
      {required this.index,
      required this.fromLecture,
      required this.result,
      required this.reset,
      required this.passed});

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
                onPressed: passed ? null : reset,
                style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    fixedSize:
                        Size(MediaQuery.of(context).size.width * .35, 45)),
                child: const Text("Restart Quiz"),
              ),
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      if (fromLecture && index < state.user!.level! - 1) {
                        context.read<UserBloc>().add(
                              UpdateUser(
                                user: User(
                                  id: state.user!.id,
                                  level: state.user!.level! + 1,
                                ),
                              ),
                            );
                        context.read<UserBloc>().add(
                              LoadUser(),
                            );
                      }
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        fixedSize:
                            Size(MediaQuery.of(context).size.width * .35, 45)),
                    child: const Text("Finish"),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
