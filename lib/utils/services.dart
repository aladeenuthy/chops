import 'package:chops/utils/constants.dart';
import 'package:flutter/material.dart';

import '../helpers/key_helper.dart';
void showLoadingSpinner() {
  AlertDialog alert = AlertDialog(
    content: Row(
      children: const [
        CircularProgressIndicator(color: primaryColor),
        SizedBox(width: 10),
        Text("Loading"),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: KeyHelper.appNavKey.currentContext!,
    builder: (context) {
      return alert;
    },
  );
}

void showSnackBar(String message, [bool error = true]) {
  KeyHelper.scafKey.currentState!.showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: error ? Colors.redAccent : Colors.greenAccent,
  ));
}

Widget inputField(
  String hintText,
  String? Function(String?) validator,
  TextEditingController? controller,
  {
  TextInputType inputType = TextInputType.text,
  bool obscureText = false
}
) {
  return TextFormField(
    validator: validator,
    keyboardType: inputType,
    obscureText: obscureText,
    decoration: InputDecoration(
      label: Text(hintText),
    ),
  );
}
