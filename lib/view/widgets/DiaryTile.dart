import 'package:diary_app/controllers/diary_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiaryTile extends StatefulWidget {
  const DiaryTile({
    super.key,
    this.title,
    required this.uid,
    required this.lastDiary,
  });

  final String? title;
  final String uid;
  final bool lastDiary;

  @override
  State<DiaryTile> createState() => _DiaryTileState();
}

class _DiaryTileState extends State<DiaryTile> {
  bool modifytTitle = false;

  var controller = Get.find<DiaryController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff8F00FF).withOpacity(0.6),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (widget.title == null && widget.lastDiary) || modifytTitle
              ? Expanded(
                  child: SizedBox(
                    height: 25,
                    child: TextField(
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        hintText: widget.title ?? "다이어리",
                        hintStyle: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                        ),
                        contentPadding: const EdgeInsets.all(0),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                )
              : Text(
                  widget.title ?? "다이어리${widget.uid}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (widget.title == null && widget.lastDiary) {
                    controller.updateDiary(uid: widget.uid, title: "asd");
                    return;
                  }
                  if (!modifytTitle) {
                    modifytTitle = true;
                    setState(() {});
                  } else {
                    controller.updateDiary(uid: widget.uid, title: "asd");
                    modifytTitle = false;
                    setState(() {});
                  }
                },
                child: Text(
                  (widget.title == null && widget.lastDiary) || modifytTitle
                      ? "확정"
                      : "수정",
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () => controller.deletedDiary(context, widget.uid),
                child: const Text(
                  "삭제",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
