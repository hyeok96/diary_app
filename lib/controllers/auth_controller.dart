import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  Rxn<User> user = Rxn<User>();

  login() {}

  signup(String email, String pw) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: pw);
  }

  @override
  void onInit() {
    super.onInit();
    FirebaseAuth.instance.authStateChanges().listen((value) {
      if (value != null) {
        user(value);
      }
    });
  }
}
