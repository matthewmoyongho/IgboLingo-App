import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';

import '../../../../data/repositories/authentication_repository.dart';
import '../../../../data/service/forms_inputs/email_input.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  AuthenticationRepository repository;
  LoginCubit(this.repository) : super(LoginState());

  void emailChanged(String value) {
    final email = EmailInput.dirty(value);
    emit(
      state.copyWith(
        emailInput: email,
        formStatus: Formz.validate([email, state.passwordInput]),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = EmailInput.dirty(value);
    emit(
      state.copyWith(
        emailInput: password,
        formStatus: Formz.validate([password, state.passwordInput]),
      ),
    );
  }

  Future login() async {
    if (state.formStatus == false) return null;
    emit(
      state.copyWith(status: FormzSubmissionStatus.inProgress),
    );
    try {
      await repository.login(state.emailInput.value, state.passwordInput.value);
      emit(
        state.copyWith(status: FormzSubmissionStatus.success),
      );
    } on LoginWithEmailAndPasswordError catch (e) {
      emit(
        state.copyWith(
            errorMessage: e.message, status: FormzSubmissionStatus.failure),
      );
    } catch (_) {
      emit(
        state.copyWith(status: FormzSubmissionStatus.failure),
      );
    }
  }
}
