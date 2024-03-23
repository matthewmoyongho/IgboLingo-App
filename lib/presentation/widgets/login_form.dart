import 'package:firebase_auth/firebase_auth.dart' as firebaseAuth;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igbo_lang_tutor/domain/business_logic/blocs/login/login_cubit.dart';
import 'package:igbo_lang_tutor/domain/business_logic/blocs/login/login_state.dart';
import 'package:igbo_lang_tutor/domain/business_logic/blocs/sign_up/sign_up_cubit.dart';
import 'package:igbo_lang_tutor/presentation/screens/sign_up.dart';

import '../../core/constants.dart';
import '../../data/models/user.dart';
import '../../domain/business_logic/blocs/sign_up/sign_up_state.dart';
import '../../domain/business_logic/blocs/user/user_bloc.dart';
import '../../domain/business_logic/blocs/user/user_event.dart';
import '../screens/tab_widget.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

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
          height: 10,
        ),
        Container(
            width: double.infinity,
            alignment: Alignment.centerRight,
            child: _forgotPassword()),
        const SizedBox(
          height: 40,
        ),
        _loginButton(deviceSize),
        const SizedBox(
          height: 20,
        ),
        _signupButton(),
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
            const SizedBox(
              width: 10,
            ),
            const Text('Or'),
            const SizedBox(
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
    return BlocBuilder<LoginCubit, LoginState>(
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
              key: const Key('login_email_input_field'),
              textInputAction: TextInputAction.next,
              onChanged: (val) => context.read<LoginCubit>().emailChanged(val),
              decoration: const InputDecoration(
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
    return BlocBuilder<LoginCubit, LoginState>(
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
              key: const Key('login_password_input_field'),
              textInputAction: TextInputAction.next,
              onChanged: (val) =>
                  context.read<LoginCubit>().passwordChanged(val),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                isDense: true,
                suffixIcon: GestureDetector(
                  onTap: () => context.read<LoginCubit>().updateShowPassword(),
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

class _loginButton extends StatelessWidget {
  Size deviceSize;

  _loginButton(this.deviceSize);
  // final spinkit = SpinKitFadingCircle(
  //   itemBuilder: (BuildContext context, int index) {
  //     return DecoratedBox(
  //       decoration: BoxDecoration(
  //         color: index.isEven ? Colors.red : Colors.blue[900],
  //       ),
  //     );
  //   },
  // );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      return state.status == FormzSubmissionStatus.inProgress
          ? const CircularProgressIndicator(
              color: kPrimaryColor,
            )
          : ElevatedButton(
              onPressed: state.emailInput.isNotValid
                  ? null
                  : () async {
                      FocusManager.instance.primaryFocus?.unfocus();
                      await context.read<LoginCubit>().login().then((value) {
                        // Navigator.of(context).pushReplacement(MaterialPageRoute(
                        //     builder: (_) => TabWidget(title: 'title')));
                      });
                    },
              style: ElevatedButton.styleFrom(
                  primary: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  fixedSize: Size(deviceSize.width, 48)),
              child: Text(
                'Login',
                style: GoogleFonts.poppins(fontSize: 14),
              ),
            );
    });
  }
}

class _forgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      return TextButton(
        onPressed: () {},
        child: Text(
          'Forgot password',
          style:
              GoogleFonts.poppins(fontSize: 14, color: const Color(0XFF939292)),
        ),
      );
    });
  }
}

class _signupButton extends StatelessWidget {
  const _signupButton({Key? key}) : super(key: key);

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
                      text: 'Don\'t have an account?',
                      style:
                          GoogleFonts.poppins(fontSize: 14, color: kTextColor)),
                  TextSpan(
                    text: ' Sign up',
                    style:
                        GoogleFonts.poppins(fontSize: 14, color: kPrimaryColor),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const SignUp(),
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
        onPressed: () async {
          FocusScope.of(context).unfocus();

          await context.read<LoginCubit>().googleSignIn().then((user) async {
            if (user != null) {
              final localUser = User(
                id: user.uid,
                level: 1,
                email: user.email,
                name: user.displayName,
              );
              context.read<UserBloc>().add(AddUser(localUser,
                  firebaseAuth.FirebaseAuth.instance.currentUser!.uid));
            }
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => TabWidget(title: 'title'),
              ),
            );
          });
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0XFFFFFFFF),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            fixedSize: Size(deviceSize.width, 48)),
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
