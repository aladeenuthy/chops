import 'package:chops/helpers/auth_helper.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import 'components/input_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _nameController = TextEditingController();
  void signUp() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    FocusScope.of(context).unfocus();
    final userInfo = {
      'email': _emailController.text.trim(),
      'password': _passwordController.text.trim(),
      'phoneNumber': _phoneController.text.trim(),
      'address': _addressController.text.trim(),
      'fullName': _nameController.text.trim()
    };
    setState(() {
      _isLoading = true;
    });
    await AuthHelper.signUp(userInfo);
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: const PageStorageKey<String>('signup'),
      child: Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 20,
            right: 20),
        child: AbsorbPointer(
          absorbing: _isLoading,
          child: Form(
            key: _formKey,
            child:
                Column(
                  
                  crossAxisAlignment: CrossAxisAlignment.start, children: [
              InputField(
                labelText: "Full name",
                controller: _nameController,
                validator: (value) {
                  if (value!.isEmpty || value.length < 5) {
                    return 'name is too short!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              InputField(
                labelText: "Email address",
                keyBoardType: TextInputType.emailAddress,
                controller: _emailController,
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Invalid email!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              InputField(
                labelText: "Phone number",
                keyBoardType: TextInputType.number,
                controller: _phoneController,
              ),
              const SizedBox(height: 10),
              InputField(
                labelText: "House address",
                controller: _addressController,
              ),
              const SizedBox(height: 10),
              InputField(
                labelText: "Password",
                controller: _passwordController,
                validator: (value) {
                  if (value!.isEmpty || value.length < 5) {
                    return 'Password is too short!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: signUp,
                child: _isLoading ? const CircularProgressIndicator(color: whiteColor,) : const Text(
                  "Sign up",
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ]),
          ),
        ),
      ),
    );
  }
}
