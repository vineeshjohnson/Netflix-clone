import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          kWidth,
          Text(
            title,
            style: GoogleFonts.montserrat(
                fontSize: 22, fontWeight: FontWeight.w700),
          ),
          const Spacer(),
          const Icon(
            Icons.cast,
            color: Colors.white,
            size: 25,
          ),
          kWidth,
          Container(
            color: Colors.blue,
            width: 25,
            height: 25,
          ),
          kWidth
        ],
      ),
    );
  }
}
