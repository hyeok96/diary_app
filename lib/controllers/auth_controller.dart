import 'package:diary_app/view/screens/home_screen.dart';
import 'package:diary_app/view/screens/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  Rxn<User> user = Rxn<User>();

  login(String email, String pw) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: pw);
  }

  signup(String email, String pw) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pw);
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    super.onInit();
    FirebaseAuth.instance.authStateChanges().listen((value) {
      user(value);
      if (value != null) {
        Get.offAndToNamed(HomeScreen().route);
      } else {
        Get.toNamed(MainScreen().route);
      }
    });
  }
}
