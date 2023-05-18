class NoteModel {
  String title;
  String content;
  String? image;

  NoteModel({required this.title, required this.content, this.image});

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
        title: map["title"], content: map["content"], image: map["image"]);
  }
}
