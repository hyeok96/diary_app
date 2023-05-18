import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_app/controllers/auth_controller.dart';
import 'package:diary_app/models/profile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SettingController extends GetxController {
  var user = Get.find<AuthController>().user;
  var currentUser = FirebaseAuth.instance.currentUser;

  RxnString email = RxnString();
  RxnString uid = RxnString();
  RxnString profileImgUrl = RxnString();

  logout() {
    Get.find<AuthController>().logout();
  }

  fetchProfile(String uid) async {
    var res =
        await FirebaseFirestore.instance.collection("profile").doc(uid).get();
    var data = res.data();
    var result = ProfileModel.fromMap(data!);
    email(result.email);
    profileImgUrl(user.value!.photoURL);
  }

  uploadProfile(XFile file) async {
    var ref = FirebaseStorage.instance.ref("/images/$uid/");
    await ref.putFile(File(file.path));
    var url = await ref.getDownloadURL();
    currentUser!.updatePhotoURL(url);
    profileImgUrl(url);
  }

  @override
  void onInit() {
    super.onInit();
    uid(user.value!.uid);
    fetchProfile(user.value!.uid);
  }
}
