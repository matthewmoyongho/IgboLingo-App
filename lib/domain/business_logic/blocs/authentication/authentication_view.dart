import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:igbo_lang_tutor/domain/business_logic/blocs/authentication/authentication_bloc.dart';
import 'package:igbo_lang_tutor/presentation/screens/splash_screen.dart';

import '../../../../data/repositories/authentication_repository.dart';

class AuthenticationView extends StatelessWidget {
  final AuthenticationRepository _repository;

  const AuthenticationView(
      {Key? key, required AuthenticationRepository repository})
      : _repository = repository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
        value: (context) => _repository,
        child: MultiBlocProvider(
          providers: [
            BlocProvider<AuthenticationBloc>(
              create: (BuildContext context) =>
                  AuthenticationBloc(repository: _repository),
            ),
          ],
          child: SplashScreen(),
        ));
  }
}
