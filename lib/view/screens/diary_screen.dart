import 'package:diary_app/controllers/diary_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/DiaryTile.dart';

class DiaryScreen extends GetView<DiaryController> {
  const DiaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          right: 28,
          left: 28,
          top: 40,
        ),
        child: Column(
          children: [
            controller.diaryList.value != null
                ? Expanded(
                    child: Obx(
                      () => ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return DiaryTile(
                            uid:
                                "${int.parse(controller.diaryList.value![index].uid)}",
                            lastDiary: controller.lastUid.value ==
                                controller.diaryList.value![index].uid,
                            title: controller.diaryList.value![index].title,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 14,
                          );
                        },
                        itemCount: controller.diaryList.value!.length,
                      ),
                    ),
                  )
                : const SizedBox(
                    height: 0,
                  ),
            const SizedBox(
              height: 20,
            ),
            DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(
                10,
              ),
              color: const Color(0xff8F00FF),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 12,
                ),
                child: GestureDetector(
                  onTap: () => controller.createDiary(
                    controller.diaryList.value!.length.toString(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.add,
                        color: Color(0xff8F00FF),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "다이어리 생성하기",
                        style: TextStyle(
                          color: Color(0xff8F00FF),
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
