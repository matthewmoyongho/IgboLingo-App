import '../../../../../data/service/forms_inputs/email_input.dart';
import '../../../../../data/service/forms_inputs/password_input.dart';

class SignUpState {
  final EmailInput emailInput;
  final PasswordInput passwordInput;
  final bool category;
  final bool showPassword;
  final String? errorMessage;
  final bool formStatus;

  const SignUpState(
      {this.passwordInput = const PasswordInput.pure(),
      this.emailInput = const EmailInput.pure(),
      this.formStatus = false,
      this.category = false,
      this.showPassword = false,
      this.errorMessage});

  SignUpState copyWith({
    EmailInput? emailInput,
    PasswordInput? passwordInput,
    bool? category,
    bool? showPassword,
    String? errorMessage,
    bool? formStatus,
  }) {
    return SignUpState(
      emailInput: emailInput ?? this.emailInput,
      passwordInput: passwordInput ?? this.passwordInput,
      category: category ?? this.category,
      showPassword: showPassword ?? this.showPassword,
      errorMessage: errorMessage ?? this.errorMessage,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
