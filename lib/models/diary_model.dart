import 'package:diary_app/models/note_model.dart';

class DiaryModel {
  List<NoteModel> notes;

  DiaryModel({required this.notes});

  factory DiaryModel.fromMap(Map<String, dynamic> map) {
    return DiaryModel(
      notes: List<NoteModel>.from(
        map["notes"].map(
          (e) => NoteModel.fromMap(e),
        ),
      ),
    );
  }
}
