import 'package:equatable/equatable.dart';

import '../../../../data/models/user.dart';

class UserState extends Equatable {
  User? user;
  UserState({this.user});

  @override
  List<Object?> get props => [];
}

class UserLoading extends UserState {
  UserLoading() : super();
}

class UserLoaded extends UserState {
  @override
  User? user;
  UserLoaded({required this.user}) : super(user: user);

  @override
  List<Object?> get props => [user];
}

class UserLoadingFailed extends UserState {
  @override
  User? user;
  UserLoadingFailed({required this.user}) : super(user: user);

  @override
  List<Object?> get props => [user];
}
