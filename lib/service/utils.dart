



import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

sealed class Utils {
  static bool regexName(String text) => RegExp("^[a-z A-Z]{4,}").hasMatch(text.trim());

  static bool regexPhone(String phone) =>  RegExp(r"[0-9]{9}$").hasMatch(phone.trim());

  static bool regexPassword(String password) => RegExp(r"[a-z A-Z 0-9]{6,}").hasMatch(password.trim());


  static var maskFormatterPhone = MaskTextInputFormatter(
      mask: '(##) ###-##-##',
      filter: { "#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy
  );

}