import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String labelText;
  final TextInputType? keyBoardType;
  const InputField({Key? key, required this.labelText, this.keyBoardType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyBoardType ?? TextInputType.text,
      obscureText: labelText == "Password" ? true : false,
      decoration: InputDecoration(
        label: Text(labelText),
      ),
    );
  }
}
