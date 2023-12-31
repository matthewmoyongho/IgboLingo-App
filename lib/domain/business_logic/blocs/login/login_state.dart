import 'package:formz/formz.dart';

import '../../../../data/service/forms_inputs/email_input.dart';
import '../../../../data/service/forms_inputs/password_input.dart';

class LoginState {
  final EmailInput emailInput;
  final PasswordInput passwordInput;
  final bool showPassword;
  final bool formStatus;
  final String? errorMessage;
  final FormzSubmissionStatus status;
  LoginState(
      {this.emailInput = const EmailInput.pure(),
      this.passwordInput = const PasswordInput.pure(),
      this.showPassword = false,
      this.formStatus = false,
      this.errorMessage,
      this.status = FormzSubmissionStatus.initial});

  LoginState copyWith({
    EmailInput? emailInput,
    PasswordInput? passwordInput,
    bool? showPassword,
    bool? formStatus,
    String? errorMessage,
    FormzSubmissionStatus? status,
  }) {
    return LoginState(
        emailInput: emailInput ?? this.emailInput,
        passwordInput: passwordInput ?? this.passwordInput,
        showPassword: showPassword ?? this.showPassword,
        formStatus: formStatus ?? this.formStatus,
        status: status ?? this.status);
  }
}
