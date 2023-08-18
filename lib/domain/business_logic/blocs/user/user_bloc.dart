import 'package:bloc/bloc.dart';
import 'package:igbo_lang_tutor/data/models/user.dart';
import 'package:igbo_lang_tutor/data/repositories/user_repository.dart';

import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final String? uid;
  final UserRepository _repository;
  UserBloc({this.uid, required UserRepository repository})
      : _repository = repository,
        super(UserState(user: User(id: uid))) {
    on<LoadUser>(_loadUser);
    on<UpdateUser>(_UpdateUser);
    on<AddUser>(_addUser);
  }

  void _loadUser(LoadUser event, Emitter<UserState> emit) async {
    final User? user;
    emit(UserLoading());
    user = await _repository.getUserDetails();
    if (user == null) {
      emit(UserLoadingFailed(user: state.user));
    } else {
      emit(
        UserLoaded(user: user),
      );
    }
  }

  void _UpdateUser(UpdateUser event, Emitter<UserState> emit) async {
    final User? user;
    emit(UserLoading());
    user = await _repository.getUserDetails();
    if (user == null) {
      emit(UserLoadingFailed(user: state.user));
    } else {
      emit(
        UserLoaded(user: user),
      );
    }
  }

  void _addUser(AddUser event, Emitter<UserState> emit) async {
    emit(UserLoading());
    await _repository.addUserUserDetails(event.user);
  }
}
