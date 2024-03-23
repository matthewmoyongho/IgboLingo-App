import 'package:formz/formz.dart';
import 'package:igbo_lang_tutor/data/service/forms_inputs/name_input.dart';

import '../../../../../data/service/forms_inputs/email_input.dart';
import '../../../../../data/service/forms_inputs/password_input.dart';

class SignUpState {
  final EmailInput emailInput;
  final NameInput nameInput;
  final PasswordInput passwordInput;
  final bool category;
  final bool showPassword;
  final String? errorMessage;
  final bool formStatus;
  final FormzSubmissionStatus? status;

  const SignUpState(
      {this.nameInput = const NameInput.pure(),
      this.passwordInput = const PasswordInput.pure(),
      this.emailInput = const EmailInput.pure(),
      this.formStatus = false,
      this.category = false,
      this.showPassword = false,
      this.errorMessage,
      this.status = FormzSubmissionStatus.initial});

  SignUpState copyWith({
    NameInput? nameInput,
    EmailInput? emailInput,
    PasswordInput? passwordInput,
    bool? category,
    bool? showPassword,
    String? errorMessage,
    bool? formStatus,
    FormzSubmissionStatus? status,
  }) {
    return SignUpState(
      nameInput: nameInput ?? this.nameInput,
      emailInput: emailInput ?? this.emailInput,
      passwordInput: passwordInput ?? this.passwordInput,
      category: category ?? this.category,
      showPassword: showPassword ?? this.showPassword,
      errorMessage: errorMessage ?? this.errorMessage,
      formStatus: formStatus ?? this.formStatus,
      status: status ?? this.status,
    );
  }
}
