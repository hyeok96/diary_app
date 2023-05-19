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
        padding: const EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 28,
        ),
        child: Column(
          children: [
            Obx(
              () => ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return const DiaryTile();
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 18,
                    );
                  },
                  itemCount: controller.diaryList.value!.length),
            ),
            const SizedBox(
              height: 18,
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
          ],
        ),
      ),
    );
  }
}
