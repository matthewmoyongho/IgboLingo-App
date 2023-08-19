import 'package:formz/formz.dart';

enum PhoneInputValidator { invalid }

class PhoneInput extends FormzInput<String, PhoneInputValidator> {
  const PhoneInput.pure() : super.pure('');
  const PhoneInput.dirty([String value = '']) : super.dirty(value);

  static final _validPhone = RegExp(r"^(?:\d{11})?$");

  @override
  PhoneInputValidator? validator(String value) {
    return _validPhone.hasMatch(value) ? null : PhoneInputValidator.invalid;
  }
}
