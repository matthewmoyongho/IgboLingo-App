import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:igbo_lang_tutor/data/repositories/authentication_repository.dart';
import 'package:igbo_lang_tutor/data/repositories/user_repository.dart';
import 'package:igbo_lang_tutor/domain/business_logic/blocs/user/user_bloc.dart';
import 'package:igbo_lang_tutor/domain/business_logic/blocs/video/video_bloc.dart';
import 'package:igbo_lang_tutor/presentation/screens/sign_up.dart';
import 'package:igbo_lang_tutor/presentation/screens/tab_widget.dart';

import './domain/business_logic/blocs/authentication/authentication_bloc.dart';
import './domain/business_logic/blocs/login/login_cubit.dart';
import './domain/business_logic/blocs/sign_up/sign_up_cubit.dart';
import 'data/repositories/lecture_repository.dart';
import 'domain/business_logic/blocs/authentication/authentication_state.dart';

class App extends StatelessWidget {
  App({
    Key? key,
    required this.repository,
    required this.showHome,
    required this.videoRepository,
  }) : super(key: key);
  final bool showHome;
  final AuthenticationRepository repository;
  final LectureRepository videoRepository;
  late String _uid;
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      _uid = FirebaseAuth.instance.currentUser!.uid;
    }
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
                  VideoBloc(videoRepository: videoRepository)),
          BlocProvider<UserBloc>(
            create: (BuildContext context) => UserBloc(
                uid: _uid,
                repository: UserRepository(firestore: _firestore, uid: _uid)),
          )
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
                            ? const TabWidget(title: 'title')
                            : SignUp(),
                      );
                    })
            // : const OnboardingScreen(),
            ),
      ),
    );
  }
}
