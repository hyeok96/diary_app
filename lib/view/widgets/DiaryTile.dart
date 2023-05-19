import 'package:flutter/material.dart';

class DiaryTile extends StatelessWidget {
  const DiaryTile({
    super.key,
  });

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
          const Text(
            "다이어리",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          Row(
            children: const [
              Text(
                "수정",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "삭제",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
