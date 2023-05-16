import 'package:diary_app/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends GetView<SignupController> {
  SignupScreen({super.key});
  var route = "/signup";

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
                    errorText: controller.emailErrorText.value,
                    hintText: "이메일을 입력해주세요",
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
              TextField(
                controller: controller.pwController,
                decoration: const InputDecoration(
                  hintText: "비밀번호을 입력해주세요",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff8F00FF),
                    ),
                  ),
                ),
                cursorColor: const Color(0xff8F00FF),
                obscureText: true,
              ),
              const SizedBox(
                height: 24,
              ),
              Obx(
                () => TextField(
                  controller: controller.checkPwController,
                  decoration: InputDecoration(
                    hintText: "비밀번호을 한번 더 입력해주세요",
                    errorText: controller.checkPwErrorText.value,
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff8F00FF),
                      ),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff8F00FF),
                      ),
                    ),
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
                    onPressed: controller.signup,
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          // Color(0xff8F00FF),
                          controller.textFiledisNotEmpty.value
                              ? const Color(0xff8F00FF)
                              : Colors.grey),
                    ),
                    child: const Text("회원가입"),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
