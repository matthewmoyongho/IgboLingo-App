import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:igbo_lang_tutor/data/service/forms_inputs/email_input.dart';

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
          formStatus: Formz.validate([email, state.passwordInput])),
    );
  }
}
