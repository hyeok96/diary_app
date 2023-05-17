import 'package:flutter/material.dart';

class NaviTab extends StatelessWidget {
  const NaviTab({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  final String text;
  final bool isSelected;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: AnimatedContainer(
          duration: const Duration(
            milliseconds: 300,
          ),
          alignment: Alignment.center,
          height: double.maxFinite,
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : const Color(0xff8F00FF),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 25,
              color: isSelected ? const Color(0xff8F00FF) : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
