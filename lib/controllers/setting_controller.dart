import 'package:diary_app/controllers/auth_controller.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  logout() {
    Get.find<AuthController>().logout();
  }
}
