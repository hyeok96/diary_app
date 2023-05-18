import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_app/models/profile_model.dart';
import 'package:diary_app/view/screens/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  Rxn<User> user = Rxn<User>();
  Rxn<ProfileModel> profile = Rxn<ProfileModel>();

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

  logout() {
    FirebaseAuth.instance.signOut();
  }

  createProfile(String uid, String email) async {
    await FirebaseFirestore.instance.collection("profile").doc(uid).set({
      "email": email,
    }, SetOptions(merge: true));
  }

  @override
  void onInit() {
    super.onInit();
    FirebaseAuth.instance.authStateChanges().listen((value) {
      user(value);
      if (value != null) {
        createProfile(value.uid, value.email.toString());
        Get.offAndToNamed("/home");
      } else {
        Get.toNamed(MainScreen().route);
      }
    });
  }
}
