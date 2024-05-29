import 'package:flutter/material.dart';

class MainTitleWidget extends StatelessWidget {
  final String heading;
  const MainTitleWidget({super.key, required this.heading});

  @override
  Widget build(BuildContext context) {
    return Text(
      heading,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}
