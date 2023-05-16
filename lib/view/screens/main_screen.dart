import 'package:diary_app/services/auth_service.dart';
import 'package:diary_app/view/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  var route = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "나를",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),
              ),
              const Text(
                "기록하다",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),
              ),
              const Text(
                "나만의 다이어리",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),
              ),
              const Text(
                "NOTE",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                  color: Color(0xff8F00FF),
                ),
              ),
              const SizedBox(
                height: 500,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(LoginScreen().route);
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Color(0xff8F00FF),
                  ),
                ),
                child: const Text("이메일로 로그인"),
              ),
              ElevatedButton(
                onPressed: () {
                  AuthService().signInWithGoogle();
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Color(0xff8F00FF),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.g_mobiledata_sharp,
                    ),
                    Text("구글 로그인"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
