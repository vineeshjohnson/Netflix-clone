import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/downloads/models/model.dart'; // Adjust import based on your project structure
import 'package:netflix/presentation/common%20widgets/main_card.dart';
import 'package:netflix/presentation/common%20widgets/main_title.dart';

class HomeMainCard extends StatelessWidget {
  const HomeMainCard({super.key, required this.title, required this.movies});
  final String title;
  final List<DownloadModel> movies;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitleWidget(heading: title),
        kHeight,
        LimitedBox(
          maxHeight: 170,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) => MainCardHome(movie: movies[index]),
          ),
        ),
        kHeight
      ],
    );
  }
}
