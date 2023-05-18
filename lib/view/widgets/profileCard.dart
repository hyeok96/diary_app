import 'package:flutter/material.dart';

class profileCard extends StatelessWidget {
  const profileCard({
    super.key,
    required this.onTapLogout,
    required this.email,
    this.profileUrl,
  });

  final Function onTapLogout;
  final String email;
  final String? profileUrl;

  @override
  Widget build(BuildContext context) {
    print(profileUrl);

    return Row(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage:
                  profileUrl != null ? NetworkImage(profileUrl!) : null,
            ),
            const Positioned(
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
            Text(
              email.split("@")[0],
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              email,
              style: const TextStyle(fontSize: 15, color: Colors.grey),
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
