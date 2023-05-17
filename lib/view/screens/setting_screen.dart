import 'package:diary_app/controllers/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/profileCard.dart';

class Settingscreen extends GetView<SettingController> {
  const Settingscreen({super.key});

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
              profileCard(
                onTapLogout: controller.logout,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
