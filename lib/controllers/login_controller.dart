import 'package:diary_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  RxBool textFiledIsNotEmpty = false.obs;
  RxnString errorText = RxnString(null);

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

  login() {
    Get.find<AuthController>().login(emailController.text, pwController.text);
  }

  @override
  void onInit() {
    super.onInit();
    emailController.addListener(() {
      if (emailValid() != null) {
        errorText(emailValid());
      } else {
        errorText.value = null;
      }

      if (pwController.text.isNotEmpty && emailController.text.isNotEmpty) {
        textFiledIsNotEmpty(true);
      } else {
        textFiledIsNotEmpty(false);
      }
    });
    pwController.addListener(() {
      if (pwController.text.isNotEmpty && emailController.text.isNotEmpty) {
        textFiledIsNotEmpty(true);
      } else {
        textFiledIsNotEmpty(false);
      }
    });
  }
}
