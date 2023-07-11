import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../../data/repositories/authentication_repository.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _repository;
  AuthenticationBloc({required AuthenticationRepository repository})
      : _repository = repository,
        super(repository.currentUser.isNotEmpty
            ? AuthenticationState.authenticated(repository.currentUser)
            : AuthenticationState.unAuthenticated()) {
    on<UserChanged>(_userChanged);
    on<LogoutRequest>(_logout);
  }

  void _userChanged(
      UserChanged event, Emitter<AuthenticationState> emit) async {
    emit(event.user.isNotEmpty
        ? AuthenticationState.authenticated(event.user)
        : AuthenticationState.unAuthenticated());
  }

  void _logout(LogoutRequest event, Emitter<AuthenticationState> emit) async {
    unawaited(_repository.logout());
    emit(AuthenticationState.unAuthenticated());
  }
}
