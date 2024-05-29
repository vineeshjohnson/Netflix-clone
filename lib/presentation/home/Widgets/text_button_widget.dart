import 'package:flutter/material.dart';
import 'package:netflix/core/colors.dart';

class TextButtonHome extends StatelessWidget {
  const TextButtonHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: const Padding(
        padding: EdgeInsets.only(left: 5, top: 3),
        child: Icon(
          Icons.play_arrow,
          size: 25,
          color: black,
        ),
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          'Play',
          style: TextStyle(color: black, fontSize: 20),
        ),
      ),
      style: TextButton.styleFrom(
          backgroundColor: white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
    );
  }
}
