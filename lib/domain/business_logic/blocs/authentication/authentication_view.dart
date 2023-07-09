// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:igbo_lang_tutor/domain/business_logic/blocs/authentication/authentication_bloc.dart';
// import 'package:igbo_lang_tutor/domain/business_logic/blocs/authentication/authentication_state.dart';
// import 'package:igbo_lang_tutor/domain/business_logic/blocs/login/login_cubit.dart';
// import 'package:igbo_lang_tutor/domain/business_logic/blocs/sign_up/sign_up_cubit.dart';
// import 'package:igbo_lang_tutor/presentation/screens/home_screen.dart';
// import 'package:igbo_lang_tutor/presentation/screens/onboarding/onboarding_screen.dart';
// import 'package:igbo_lang_tutor/presentation/screens/sign_up.dart';
//
// import '../../../../data/repositories/authentication_repository.dart';
//
// class AuthenticationView extends StatelessWidget {
//   final AuthenticationRepository _repository;
//   final bool showHome;
//
//   const AuthenticationView(
//       {Key? key,
//       required AuthenticationRepository repository,
//       required this.showHome})
//       : _repository = repository,
//         super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return RepositoryProvider.value(
//         value: (context) => _repository,
//         child: MultiBlocProvider(
//           providers: [
//             BlocProvider<AuthenticationBloc>(
//               create: (BuildContext context) =>
//                   AuthenticationBloc(repository: _repository),
//             ),
//             BlocProvider<SignUpCubit>(
//               create: (BuildContext context) => SignUpCubit(_repository),
//             ),
//             BlocProvider<LoginCubit>(
//                 create: (BuildContext context) => LoginCubit(_repository))
//           ],
//           child: showHome
//               ? BlocBuilder<AuthenticationBloc, AuthenticationState>(
//                   buildWhen: (previous, current) => current != previous,
//                   builder: (ctx, state) {
//                     return state.authStatus ==
//                             AuthenticationStatus.authenticated
//                         ? const HomeScreen(
//                             title: 'Home',
//                           )
//                         : SignUp();
//                   })
//               : OnboardingScreen(),
//         ));
//   }
// }
