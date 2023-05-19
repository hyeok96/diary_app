import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_app/models/diary_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiaryController extends GetxController {
  var instance = FirebaseFirestore.instance;
  Rxn<List> diaryList = Rxn<List>([]);
  RxnString lastUid = RxnString();
  RxBool modifyTitle = false.obs;

  readDiaryFromFirebase() async {
    var ref = await instance.collection("diary").get();
    var items = ref.docs
        .map(
          (e) => Map<String, dynamic>.from(
            e.data(),
          ),
        )
        .toList()
        .reversed;
    var results = items.map((e) => DiaryModel.fromMap(e)).toList();
    diaryList(results);
    lastUid("${results.length - 1}");
  }

  updateDiary({required String uid, String? title}) async {
    var res =
        await instance.collection("diary").doc(uid).update({"title": title});
    readDiaryFromFirebase();
  }

  createDiary(
    String uid,
  ) async {
    var res = await instance.collection("diary").doc(uid).set({
      "uid": uid,
    });
    readDiaryFromFirebase();
    // updateDiary(uid: "${diaryList.value!.length - 1}");
  }

  deletedDiary(
    BuildContext context,
    String uid,
  ) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 50,
        ),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              "다이어리",
              style: TextStyle(
                fontSize: 20,
                color: Color(0xff8F00FF),
              ),
            ),
            Text(
              "정말로 삭제하시겠습니까?",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
        actionsPadding: const EdgeInsets.all(0),
        actions: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                      right: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                  child: const Text(
                    "삭제",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                  child: const Text(
                    "취소",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff8F00FF),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
    // var res = await instance.collection("diary").doc(uid).delete();
  }

  @override
  void onInit() {
    super.onInit();
    readDiaryFromFirebase();
  }
}
