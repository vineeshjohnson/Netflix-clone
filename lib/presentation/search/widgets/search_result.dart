import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/downloads/models/model.dart';
import 'package:netflix/presentation/search/widgets/search_title.dart';

class SearchResultWidget extends StatelessWidget {
  final List<DownloadModel> movies;

  const SearchResultWidget({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTitle(heading: 'Movies & TV'),
        kHeight,
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1 / 1.4,
            ),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return MainCard(
                imageUrl:
                    'https://image.tmdb.org/t/p/w500${movies[index].posterPath}',
              );
            },
          ),
        )
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  final String imageUrl;

  const MainCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
