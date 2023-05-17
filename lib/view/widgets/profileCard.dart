import 'package:flutter/material.dart';

class profileCard extends StatelessWidget {
  const profileCard({
    super.key,
    required this.onTapLogout,
  });

  final Function onTapLogout;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: const [
            CircleAvatar(
              radius: 50,
            ),
            Positioned(
              bottom: 0,
              right: -1,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.black,
                child: Center(
                  child: Icon(
                    Icons.create_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          width: 25,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "aa",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const Text(
              "aa",
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => onTapLogout(),
              child: const Text(
                "로그아웃",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
