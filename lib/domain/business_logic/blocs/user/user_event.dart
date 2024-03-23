import 'package:equatable/equatable.dart';

import '../../../../data/models/user.dart';

abstract class UserEvent extends Equatable {}

class LoadUser extends UserEvent {
  LoadUser({required this.uid});
  final String uid;

  @override
  List<Object?> get props => [uid];
}

class UpdateUser extends UserEvent {
  final String uid;
  final User user;
  UpdateUser({required this.user, required this.uid});

  @override
  List<Object?> get props => [user, uid];
}

class AddUser extends UserEvent {
  final User user;
  final String uid;
  AddUser(this.user, this.uid);

  @override
  List<Object?> get props => [user];
}
