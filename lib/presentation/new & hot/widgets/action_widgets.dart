import 'package:flutter/material.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/core/constants.dart';

class ActionWidgetHot extends StatelessWidget {
  const ActionWidgetHot({super.key, required this.icon, required this.name});
  final String name;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: white,
          size: 22,
        ),
        Text(
          name,
          style: const TextStyle(fontSize: 13),
        ),
        kWidth
      ],
    );
  }
}
