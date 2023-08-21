import 'package:equatable/equatable.dart';

import '../../../../data/models/user.dart';

abstract class UserEvent extends Equatable {}

class LoadUser extends UserEvent {
  LoadUser();

  @override
  List<Object?> get props => [];
}

class UpdateUser extends UserEvent {
  User user;
  UpdateUser({required this.user});

  @override
  List<Object?> get props => [];
}

class AddUser extends UserEvent {
  final User user;
  AddUser(this.user);

  @override
  List<Object?> get props => [];
}
