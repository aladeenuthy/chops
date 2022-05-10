import 'package:chops/utils/constants.dart';
import 'package:flutter/material.dart';

import 'components/input_field.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
          const InputField(labelText: "Email address",  keyBoardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 10),
          const InputField(
            labelText: "Password",
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: (){},
            child: const Text("Forgot Password ?"),
            style: TextButton.styleFrom(
              primary: primaryColor,
              textStyle: const TextStyle(
              color: primaryColor
            ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              "Login",
              style: TextStyle(
                  color: whiteColor,
                  fontSize: 18,
                  ),
            ),
            style: ElevatedButton.styleFrom(
                primary: primaryColor,
              ),
          )
        ]),
      ),
    );
  }
}