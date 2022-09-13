import 'package:flutter/material.dart';

class NavBarItem extends StatelessWidget {
  final String title;
  final bool bordered;
  final bool borderedInverse;
  const NavBarItem({required this.title, this.bordered = false, this.borderedInverse = false, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: bordered
          ? BoxDecoration(
              color: borderedInverse ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(32),
              border: Border.all(width: 1, color: borderedInverse ? Colors.grey : Colors.white))
          : null,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: TextStyle(color: borderedInverse ? Colors.black : Colors.white),
        ),
      ),
    );
  }
}
