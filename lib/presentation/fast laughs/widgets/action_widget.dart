import 'package:flutter/material.dart';
import 'package:netflix/core/colors.dart';

class ActionWidget extends StatelessWidget {
  const ActionWidget({super.key, required this.icon, required this.name});
  final String name;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: white,
          size: 30,
        ),
        Text(name)
      ],
    );
  }
}
