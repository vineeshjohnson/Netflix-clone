import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/downloads/models/model.dart';
import 'package:netflix/presentation/common%20widgets/main_title.dart';
import 'package:netflix/presentation/home/Widgets/home_custom_card.dart';

class HomeCustomCard extends StatelessWidget {
  const HomeCustomCard({super.key, required this.title, required this.movies});
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
          maxWidth: 120,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                  10,
                  (index) => MainCustomCardHome(
                        index: index,
                        movie: movies[index],
                      ))),
        ),
        kHeight
      ],
    );
  }
}
