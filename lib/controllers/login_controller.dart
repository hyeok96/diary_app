import 'package:diary_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  RxBool textFiledIsNotEmpty = false.obs;
  RxnString errorText = RxnString(null);
  RxnString pwErrorText = RxnString(null);

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

  pwVaild() {
    if (pwController.text.isEmpty) return null;
    final regExp = RegExp(
        r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$");
    if (!regExp.hasMatch(pwController.text)) {
      return "최소8자, 하나 이상의 숫자, 문자, 특수문자를 넣어주세요";
    }
    return null;
  }

  login(BuildContext context) {
    Get.find<AuthController>()
        .login(emailController.text, pwController.text, context);
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

      if (pwController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          emailValid() == null &&
          pwVaild() == null) {
        textFiledIsNotEmpty(true);
      } else {
        textFiledIsNotEmpty(false);
      }
    });

    pwController.addListener(() {
      if (pwVaild() != null) {
        pwErrorText(pwVaild());
      } else {
        pwErrorText.value = null;
      }

      if (pwController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          emailValid() == null &&
          pwVaild() == null) {
        textFiledIsNotEmpty(true);
      } else {
        textFiledIsNotEmpty(false);
      }
    });
  }
}
