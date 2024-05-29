import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/downloads/models/model.dart';
import 'package:netflix/presentation/search/widgets/search_title.dart';

class SearchIdleWidget extends StatelessWidget {
  final List<DownloadModel> movies;

  const SearchIdleWidget({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTitle(heading: 'Top Searches'),
        kHeight,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (ctx, index) => TopSearchItemTile(
                    movie: movies[index],
                  ),
              separatorBuilder: ((context, index) => kHeight20),
              itemCount: movies.length),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final DownloadModel movie;

  const TopSearchItemTile({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Container(
          width: screenWidth * .35,
          height: 70,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://image.tmdb.org/t/p/w500${movie.posterPath}'),
                  fit: BoxFit.cover)),
        ),
        kWidth,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                movie.releaseDate,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                'Rating: ${movie.voteAverage}',
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 23,
            child: Icon(
              CupertinoIcons.play_fill,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
