import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  var route = "/home";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("HomeScreen"),
      ),
    );
  }
}
