import 'package:customwidgets/src/basic/dynamic_text.dart';
import 'package:flutter/material.dart';

class LoginBox extends StatelessWidget {
  final TextEditingController userController;
  final TextEditingController passwordController;
  final TextEditingController error;
  final Function(BuildContext context)  login;

  const LoginBox({
    super.key,
    required this.userController,
    required this.passwordController,
    required this.login,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          TextField(
            controller: userController,
            decoration: const InputDecoration(hintText: 'Username'),
          ),
          TextField(
            obscureText: true,
            controller: passwordController,

            decoration: const InputDecoration(hintText: 'Password'),
          ),
          ElevatedButton(
            onPressed: () {
              login(context);
            },
            child: const Text('Login'),
          ),

          DynamicText(controller: error),
        ],
      ),
    );
  }
}
