import 'package:diary_app/controllers/setting_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/profileCard.dart';

class Settingscreen extends StatefulWidget {
  const Settingscreen({super.key});

  @override
  State<Settingscreen> createState() => _SettingscreenState();
}

class _SettingscreenState extends State<Settingscreen> {
  var controller = Get.find<SettingController>();

  void _onTapProfileImg() async {
    var picker = ImagePicker();
    var res = await picker.pickImage(source: ImageSource.gallery);
    if (res != null) {
      controller.uploadProfile(res);
    }
  }

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.userChanges().listen((event) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 20,
          ),
          child: Column(
            children: [
              Obx(
                () => GestureDetector(
                  onTap: _onTapProfileImg,
                  child: profileCard(
                    onTapLogout: controller.logout,
                    email: controller.email.value ?? "null",
                    profileUrl: controller.profileImgUrl.value,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
