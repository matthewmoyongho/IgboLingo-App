import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igbo_lang_tutor/core/constants.dart';
import 'package:igbo_lang_tutor/domain/business_logic/blocs/sign_up/sign_up_cubit.dart';
import 'package:igbo_lang_tutor/domain/business_logic/blocs/sign_up/sign_up_state.dart';

import '../widgets/sign_up_form.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: SafeArea(
        child: BlocListener<SignUpCubit, SignUpState>(
          listener: (context, state) {
            if (state.status == FormzSubmissionStatus.failure) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage ??
                        'An error occurred! could not submit your form'),
                  ),
                );
            }
          },
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign Up',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SignUpForm(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
