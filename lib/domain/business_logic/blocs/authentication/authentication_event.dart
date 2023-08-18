import 'package:equatable/equatable.dart';

import '../../../../data/models/user.dart' as appUser;

abstract class AuthenticationEvent extends Equatable {}

class LogoutRequest extends AuthenticationEvent {
  @override
  List<Object?> get props => [];
}

class UserChanged extends AuthenticationEvent {
  final appUser.User user;
  UserChanged(this.user);

  @override
  List<Object?> get props => [user];
}

class LoadUser extends AuthenticationEvent {
  LoadUser();
  @override
  List<Object?> get props => [];
}
