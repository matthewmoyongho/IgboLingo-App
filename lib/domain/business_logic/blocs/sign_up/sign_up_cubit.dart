import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:formz/formz.dart';
import 'package:igbo_lang_tutor/data/service/forms_inputs/email_input.dart';
import 'package:igbo_lang_tutor/data/service/forms_inputs/name_input.dart';
import 'package:igbo_lang_tutor/data/service/forms_inputs/password_input.dart';
import 'package:igbo_lang_tutor/data/service/forms_inputs/phone_input.dart';

import '../../../../../data/repositories/authentication_repository.dart';
import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthenticationRepository repository;

  SignUpCubit(this.repository) : super(SignUpState());

  void emailChanged(String value) {
    final email = EmailInput.dirty(value);
    emit(
      state.copyWith(
        emailInput: email,
        formStatus: Formz.validate(
            [email, state.nameInput, state.phoneInput, state.passwordInput]),
      ),
    );
  }

  void nameChanged(String value) {
    final name = NameInput.dirty(value);
    emit(
      state.copyWith(
        nameInput: name,
        formStatus: Formz.validate(
            [name, state.phoneInput, state.emailInput, state.passwordInput]),
      ),
    );
  }

  void phoneChanged(String value) {
    final phone = PhoneInput.dirty(value);
    emit(
      state.copyWith(
        phoneInput: phone,
        formStatus: Formz.validate(
            [phone, state.nameInput, state.emailInput, state.passwordInput]),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = PasswordInput.dirty(value);
    emit(
      state.copyWith(
        passwordInput: password,
        formStatus: Formz.validate(
            [password, state.nameInput, state.phoneInput, state.emailInput]),
      ),
    );
  }

  void updateShowPassword() {
    emit(
      state.copyWith(
        showPassword: !state.showPassword,
        formStatus: Formz.validate([
          state.nameInput,
          state.phoneInput,
          state.emailInput,
          state.passwordInput
        ]),
      ),
    );
  }

  Future<User?> signUp() async {
    User? user;
    if (state.formStatus == false) return null;

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    try {
      user = await repository.signUp(
          state.emailInput.value.trim(), state.passwordInput.value.trim());
      emit(
        state.copyWith(status: FormzSubmissionStatus.success),
      );
    } on SignUpWithEmailAndPasswordError catch (e) {
      emit(state.copyWith(
          errorMessage: e.message, status: FormzSubmissionStatus.failure));
    } catch (_) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
    return user;
  }
}
