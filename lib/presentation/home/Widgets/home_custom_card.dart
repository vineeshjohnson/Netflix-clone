import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/downloads/models/model.dart';

class MainCustomCardHome extends StatelessWidget {
  const MainCustomCardHome(
      {super.key, required this.index, required this.movie});
  final int index;
  final DownloadModel movie;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
              height: 150,
            ),
            Container(
              height: 170,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://image.tmdb.org/t/p/w500${movie.posterPath}'),
                ),
              ),
            ),
            kWidth
          ],
        ),
        Positioned(
          top: 35,
          left: 15,
          child: BorderedText(
            strokeColor: Colors.white,
            strokeWidth: 5,
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                  color: black,
                  fontSize: 120,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  decorationColor: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
