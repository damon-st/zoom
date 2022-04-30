import 'package:flutter/material.dart';
import 'package:zoom/resources/auth_methods.dart';
import 'package:zoom/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Start or join a meeting",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 38.0),
          child: Image.asset(
            "assets/onboarding.jpg",
          ),
        ),
        CustomButton(
          onPressed: () async {
            bool res = await _authMethods.singInWithGoogle(context);
            if (res) {
              Navigator.of(context).pushNamed("/HomeScreen");
            }
          },
          text: "Google Sing in",
        )
      ],
    ));
  }
}
