class DiaryModel {
  int uid;

  DiaryModel({required this.uid});

  factory DiaryModel.fromMap(Map<String, dynamic> map) {
    return DiaryModel(uid: map["uid"]);
  }
}
