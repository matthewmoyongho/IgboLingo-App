import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:igbo_lang_tutor/data/repositories/authentication_repository.dart';
import 'package:igbo_lang_tutor/domain/business_logic/blocs/video/video_bloc.dart';

import './domain/business_logic/blocs/authentication/authentication_bloc.dart';
import './domain/business_logic/blocs/authentication/authentication_state.dart';
import './domain/business_logic/blocs/login/login_cubit.dart';
import './domain/business_logic/blocs/sign_up/sign_up_cubit.dart';
import './presentation/screens/home_screen.dart';
import './presentation/screens/sign_up.dart';
import 'data/repositories/lecture_repository.dart';

class App extends StatelessWidget {
  const App(
      {Key? key,
      required this.repository,
      required this.showHome,
      required this.videoRepository})
      : super(key: key);
  final bool showHome;
  final AuthenticationRepository repository;
  final LectureRepository videoRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: (context) => repository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
            create: (BuildContext context) =>
                AuthenticationBloc(repository: repository),
          ),
          BlocProvider<SignUpCubit>(
            create: (BuildContext context) => SignUpCubit(repository),
          ),
          BlocProvider<LoginCubit>(
              create: (BuildContext context) => LoginCubit(repository)),
          BlocProvider<VideoBloc>(
              create: (BuildContext context) =>
                  VideoBloc(videoRepository: videoRepository))
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'IgboLingo',
            theme: ThemeData(primarySwatch: Colors.blue),
            home:
                // showHome ?
                BlocBuilder<AuthenticationBloc, AuthenticationState>(
                    buildWhen: (previous, current) => current != previous,
                    builder: (ctx, state) {
                      // return state.authStatus ==
                      //         AuthenticationStatus.authenticated
                      //     ? const HomeScreen(
                      //         title: 'Home',
                      //       )
                      //     : const SignUp();

                      return StreamBuilder<User?>(
                        stream: FirebaseAuth.instance.authStateChanges(),
                        builder: (cxt, snapshot) => snapshot.hasData
                            ? const HomeScreen(title: 'title')
                            : SignUp(),
                      );
                    })
            // : const OnboardingScreen(),
            ),
      ),
    );
  }
}
