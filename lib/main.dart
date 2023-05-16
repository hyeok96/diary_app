import 'package:diary_app/controllers/auth_controller.dart';
import 'package:diary_app/controllers/login_controller.dart';
import 'package:diary_app/util/routes.dart';
import 'package:diary_app/view/screens/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/signup_controller.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: Routes().screens,
      initialBinding: BindingsBuilder(() {
        Get.put(AuthController());
        Get.lazyPut(
          () => LoginController(),
          fenix: true,
        );
        Get.lazyPut(
          () => SignupController(),
          fenix: true,
        );
      }),
      home: MainScreen(),
    );
  }
}
