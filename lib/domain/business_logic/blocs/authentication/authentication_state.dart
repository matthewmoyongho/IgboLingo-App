import 'package:equatable/equatable.dart';

import '../../../../data/models/user.dart' as appUser;

enum AuthenticationStatus { authenticated, unAuthenticated }

class AuthenticationState extends Equatable {
  final AuthenticationStatus authStatus;
  final appUser.User user;
  const AuthenticationState._(
      {required this.authStatus, this.user = appUser.User.empty});
  AuthenticationState.authenticated(appUser.User user)
      : this._(authStatus: AuthenticationStatus.authenticated);
  AuthenticationState.unAuthenticated()
      : this._(authStatus: AuthenticationStatus.unAuthenticated);

  @override
  List<Object?> get props => [authStatus, user];
}
