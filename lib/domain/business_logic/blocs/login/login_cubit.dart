import 'package:bloc/bloc.dart';

import '../../../../data/repositories/authentication_repository.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  AuthenticationRepository repository;
  LoginCubit(this.repository) : super(LoginState());

  void login() {}
}
