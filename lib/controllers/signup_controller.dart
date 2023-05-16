import 'package:diary_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController checkPwController = TextEditingController();
  RxBool textFiledisNotEmpty = false.obs;
  RxnString emailErrorText = RxnString(null);
  RxnString checkPwErrorText = RxnString(null);

  emailValid() {
    if (emailController.text.isEmpty) return null;
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(emailController.text)) {
      return "이메일 형식이 맞지 않습니다";
    } else {
      return null;
    }
  }

  checkPassword() {
    var coincide = pwController.text == checkPwController.text;
    if (!coincide) {
      return "비밀번호가 일치하지 않습니다";
    }
    return null;
  }

  signup() {
    AuthController()
        .signup(emailController.text.toString(), pwController.text.toString());
  }

  @override
  void onInit() {
    super.onInit();
    emailController.addListener(() {
      if (emailValid() != null) {
        emailErrorText(emailValid());
      } else {
        emailErrorText.value = null;
      }
      if (emailController.text.isNotEmpty &&
          pwController.text.isNotEmpty &&
          checkPwController.text.isNotEmpty) {
        textFiledisNotEmpty(true);
      }
    });

    pwController.addListener(() {
      if (emailController.text.isNotEmpty &&
          pwController.text.isNotEmpty &&
          checkPwController.text.isNotEmpty) {
        textFiledisNotEmpty(true);
      }
    });

    checkPwController.addListener(() {
      if (checkPassword() != null) {
        checkPwErrorText(checkPassword());
      } else {
        checkPwErrorText.value = null;
      }
      if (emailController.text.isNotEmpty &&
          pwController.text.isNotEmpty &&
          checkPwController.text.isNotEmpty) {
        textFiledisNotEmpty(true);
      }
    });
  }
}
