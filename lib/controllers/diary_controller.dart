import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DiaryController extends GetxController {
  var instance = FirebaseFirestore.instance;
  Rxn<List> diaryList = Rxn<List>([]);

  readDiaryFromFirebase() async {
    var ref = await instance.collection("diarys").get();
    var itmes = ref.docs
        .map(
          (e) => Map<String, dynamic>.from(
            e.data(),
          ),
        )
        .toList();
    diaryList(itmes);
  }

  @override
  void onInit() {
    super.onInit();
    readDiaryFromFirebase();
  }
}
