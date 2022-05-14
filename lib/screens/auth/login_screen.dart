import 'package:chops/utils/constants.dart';
import 'package:flutter/material.dart';

import 'components/input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  void login() {}
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 20,
            right: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          InputField(labelText: "Email address", controller: _emailController, validator: (value) {
            if (value!.isEmpty || !value.contains('@')) {
              return 'Invalid email!';
            }
            return null;
          },
          keyBoardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 10),
          InputField(
            labelText: "Password", 
            controller: _passwordController,
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {},
            child: const Text("Forgot Password ?"),
            style: TextButton.styleFrom(
              primary: primaryColor,
              textStyle: const TextStyle(color: primaryColor),
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
          )
        ]),
      ),
    );
  }
}
