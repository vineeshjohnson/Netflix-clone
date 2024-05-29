import 'package:flutter/material.dart';

class SearchTitle extends StatelessWidget {
  final String heading;
  const SearchTitle({super.key, required this.heading});

  @override
  Widget build(BuildContext context) {
    return Text(
      heading,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}
