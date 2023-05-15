import 'package:diary_app/view/screens/login_screen.dart';
import 'package:diary_app/view/screens/main_screen.dart';
import 'package:get/get.dart';

import '../view/screens/signup_screen.dart';

class Routes {
  var screens = [
    GetPage(name: MainScreen().route, page: () => MainScreen()),
    GetPage(name: LoginScreen().route, page: () => LoginScreen()),
    GetPage(name: SignupScreen().route, page: () => SignupScreen()),
  ];
}
