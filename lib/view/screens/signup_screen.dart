import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  var route = "/signup";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("SingUp Page"),
      ),
    );
  }
}
