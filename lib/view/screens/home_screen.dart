import 'package:diary_app/view/screens/diary_screen.dart';
import 'package:diary_app/view/screens/setting_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/NaviTab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var route = "/home";
  int selectedIndex = 0;

  onTapMenu(int index) {
    selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: selectedIndex != 0,
            child: const DiaryScreen(),
          ),
          Offstage(
            offstage: selectedIndex != 1,
            child: const Settingscreen(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 40,
          ),
          child: Container(
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xff8F00FF),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  NaviTab(
                    text: "다이어리",
                    isSelected: selectedIndex == 0,
                    onTap: () => onTapMenu(0),
                  ),
                  NaviTab(
                    text: "개인설정",
                    isSelected: selectedIndex == 1,
                    onTap: () => onTapMenu(1),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
