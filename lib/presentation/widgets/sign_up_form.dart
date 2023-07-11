import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igbo_lang_tutor/domain/business_logic/blocs/sign_up/sign_up_cubit.dart';
import 'package:igbo_lang_tutor/presentation/screens/login.dart';

import '../../core/constants.dart';
import '../../domain/business_logic/blocs/sign_up/sign_up_state.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _emailField(),
        const SizedBox(
          height: 20,
        ),
        _passwordField(),
        const SizedBox(
          height: 60,
        ),
        _registerButton(deviceSize),
        const SizedBox(
          height: 20,
        ),
        _loginButton(),
        const SizedBox(
          height: 35,
        ),
        Row(
          children: [
            Expanded(
              child: Divider(
                color: const Color(0XFF939292).withOpacity(.75),
                thickness: 0.8,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text('Or'),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Divider(
                color: const Color(0XFF939292).withOpacity(.75),
                thickness: 0.8,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        _googleSignIn(deviceSize),
      ],
    );
  }
}

class _emailField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => current != previous,
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                const Icon(
                  Icons.email_sharp,
                  color: Color(0XFF000000),
                ),
                const SizedBox(
                  width: 7,
                ),
                Text(
                  'Email',
                  style: GoogleFonts.poppins(
                      fontSize: 14, color: const Color(0XFF000000)),
                ),
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            TextField(
              key: Key('email_input_field'),
              textInputAction: TextInputAction.next,
              onChanged: (val) => context.read<SignUpCubit>().emailChanged(val),
              decoration: InputDecoration(
                  //errorText: state.emailInput.isNotValid ? 'invalid email' : null,
                  border: OutlineInputBorder(),
                  isDense: true),
            ),
          ],
        );
      },
    );
  }
}

class _passwordField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => current != previous,
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                const Icon(
                  Icons.lock_outline,
                  color: Color(0XFF000000),
                ),
                const SizedBox(
                  width: 7,
                ),
                Text(
                  'Password',
                  style: GoogleFonts.poppins(
                      fontSize: 14, color: const Color(0XFF000000)),
                ),
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            TextField(
              key: const Key('password_input_field'),
              obscureText: state.showPassword,
              textInputAction: TextInputAction.next,
              onChanged: (val) =>
                  context.read<SignUpCubit>().passwordChanged(val),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                isDense: true,
                suffixIcon: GestureDetector(
                  onTap: () {
                    context.read<SignUpCubit>().updateShowPassword();
                  },
                  child: Icon(state.showPassword
                      ? Icons.visibility
                      : Icons.visibility_off),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _registerButton extends StatelessWidget {
  Size deviceSize;

  _registerButton(this.deviceSize);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(builder: (context, state) {
      return ElevatedButton(
        onPressed: state.formStatus == true
            ? () async {
                FocusManager.instance.primaryFocus?.unfocus();
                final user = await context.read<SignUpCubit>().signUp();
              }
            : null,
        style: ElevatedButton.styleFrom(
            primary: kPrimaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            fixedSize: Size(deviceSize.width, deviceSize.height * 0.035)),
        child: Text(
          'Register',
          style: GoogleFonts.poppins(fontSize: 14),
        ),
      );
    });
  }
}

class _loginButton extends StatelessWidget {
  const _loginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
        buildWhen: (previous, present) => previous != present,
        builder: (context, state) {
          // if (state.status == FormzSubmissionStatus.inProgress)
          //   return SizedBox.shrink();
          return TextButton(
            key: const Key('Login_instead_value_text_field'),
            onPressed: () {
              // =>
              //     Navigator.of(context).pushReplacementNamed(kSignInScreenRoute)
              // ,
            },
            child: RichText(
              text: TextSpan(
                // text: 'Already have an account?',
                children: [
                  TextSpan(
                      text: 'Already have an account?',
                      style:
                          GoogleFonts.poppins(fontSize: 14, color: kTextColor)),
                  TextSpan(
                    text: ' Login',
                    style:
                        GoogleFonts.poppins(fontSize: 14, color: kPrimaryColor),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            ),
                          ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

class _googleSignIn extends StatelessWidget {
  Size deviceSize;

  _googleSignIn(this.deviceSize);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(builder: (context, state) {
      return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0XFFFFFFFF),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            fixedSize: Size(deviceSize.width, deviceSize.height * 0.035)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/google_logo.png',
              height: 25,
              width: 25,
            ),
            SizedBox(width: 7),
            Text(
              'Sign in with google',
              style:
                  GoogleFonts.poppins(fontSize: 14, color: Color(0XFF0E47A1)),
            ),
          ],
        ),
      );
    });
  }
}
