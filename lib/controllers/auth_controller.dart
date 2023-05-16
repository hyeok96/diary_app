import 'package:diary_app/view/screens/home_screen.dart';
import 'package:diary_app/view/screens/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  Rxn<User> user = Rxn<User>();

  login(String email, String pw, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pw);
    } on FirebaseAuthException catch (e) {
      if (e.code.toString() == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("비밀번호가 다릅니다."),
            duration: Duration(milliseconds: 1000),
          ),
        );
      }
    }
  }

  signup(String email, String pw) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pw);
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    super.onInit();
    FirebaseAuth.instance.authStateChanges().listen((value) {
      user(value);
      if (value != null) {
        Get.offAndToNamed(HomeScreen().route);
      } else {
        Get.toNamed(MainScreen().route);
      }
    });
  }
}
