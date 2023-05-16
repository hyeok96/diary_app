import 'package:diary_app/controllers/login_controller.dart';
import 'package:diary_app/view/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  LoginScreen({super.key});
  var route = "/login";

  _onTapUnFocusedTextFiled(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTapUnFocusedTextFiled(context),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: const Color(0xff8F00FF),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 36,
            horizontal: 36,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "나을 기록하다",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                "NOTE",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Color(0xff8F00FF),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Obx(
                () => TextField(
                  controller: controller.emailController,
                  decoration: InputDecoration(
                    hintText: "이메일을 입력해주세요",
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff8F00FF),
                      ),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff8F00FF),
                      ),
                    ),
                    errorText: controller.errorText.value,
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff8F00FF),
                      ),
                    ),
                  ),
                  cursorColor: const Color(0xff8F00FF),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Obx(
                () => TextField(
                  controller: controller.pwController,
                  decoration: InputDecoration(
                    hintText: "비밀번호를 입력해주세요",
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff8F00FF),
                      ),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff8F00FF),
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff8F00FF),
                      ),
                    ),
                    errorText: controller.pwErrorText.value,
                  ),
                  cursorColor: const Color(0xff8F00FF),
                  obscureText: true,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 60,
                child: Obx(
                  () => ElevatedButton(
                    onPressed: () => controller.textFiledIsNotEmpty.value
                        ? controller.login(context)
                        : null,
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        // Color(0xff8F00FF),
                        controller.textFiledIsNotEmpty.value
                            ? const Color(0xff8F00FF)
                            : Colors.grey,
                      ),
                    ),
                    child: const Text("로그인"),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                alignment: Alignment.centerRight,
                width: double.infinity,
                child: GestureDetector(
                  onTap: () => Get.toNamed(SignupScreen().route),
                  child: const Text(
                    "회원가입",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
