class DiaryModel {
  String uid;
  String? title;

  DiaryModel({required this.uid, this.title});

  factory DiaryModel.fromMap(Map<String, dynamic> map) {
    return DiaryModel(
      uid: map["uid"],
      title: map["title"],
    );
  }
}
