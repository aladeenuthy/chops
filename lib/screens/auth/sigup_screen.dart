import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import 'components/input_field.dart';
class SignupScreen extends StatefulWidget {
  const SignupScreen({ Key? key }) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 20,
            right: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const InputField(
            labelText: "Full name",
            keyBoardType: TextInputType.name,
          ),
          const SizedBox(height: 10),
          const InputField(
            labelText: "Email address",
            keyBoardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 10),
          const InputField(
            labelText: "Phone number",
            keyBoardType: TextInputType.number,
          ),
          const SizedBox(height: 10),
          const InputField(
            labelText: "House address",
          ),
          const SizedBox(height: 10),
          const InputField(
            labelText: "Password",
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              "Sign up",
              style: TextStyle(
                color: whiteColor,
                fontSize: 18,
              ),
            ),
            style: ElevatedButton.styleFrom(
                primary: primaryColor,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25))),
          ),
          const SizedBox(height: 10),
        ]),
      ),
    );
  }
}