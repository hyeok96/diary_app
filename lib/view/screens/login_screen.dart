import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  var route = "/login";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("LoginPage"),
      ),
    );
  }
}
