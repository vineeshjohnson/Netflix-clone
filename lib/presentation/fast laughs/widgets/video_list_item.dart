import 'package:flutter/material.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/downloads/models/model.dart';
import 'package:netflix/presentation/fast%20laughs/widgets/action_widget.dart';

class VideoTile extends StatelessWidget {
  final DownloadModel movie;

  const VideoTile({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Display the movie poster image as the background
        Positioned.fill(
          child: Image.network(
            'https://image.tmdb.org/t/p/w500${movie.posterPath}',
            fit: BoxFit.cover,
          ),
        ),
        const Positioned(
          left: 15,
          bottom: 20,
          child: Row(children: [
            CircleAvatar(
              backgroundColor: Colors.black38,
              radius: 30,
              child: Icon(
                Icons.volume_mute_outlined,
                color: white,
                size: 30,
              ),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 320, top: 300, bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                    'https://image.tmdb.org/t/p/w500${movie.posterPath}'),
              ),
              kHeight,
              const ActionWidget(icon: Icons.emoji_emotions, name: 'LOL'),
              const ActionWidget(icon: Icons.add, name: 'My list'),
              const ActionWidget(icon: Icons.share, name: 'Share'),
              const ActionWidget(icon: Icons.play_arrow, name: 'Play'),
            ],
          ),
        )
      ],
    );
  }
}
