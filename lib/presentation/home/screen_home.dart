import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/downloads/api.dart';
import 'package:netflix/domain/downloads/models/model.dart';
import 'package:netflix/presentation/common%20widgets/home_main_widget.dart';
import 'package:netflix/presentation/home/Widgets/home_custom_widget.dart';
import 'package:netflix/presentation/home/Widgets/text_button_widget.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ScreenHomeState createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  Future<List<DownloadModel>>? trendingMoviesFuture;

  @override
  void initState() {
    super.initState();
    trendingMoviesFuture = Api().getTrending();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: scrollNotifier,
      builder: (BuildContext context, bool value, Widget? child) {
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  final ScrollDirection direction = notification.direction;
                  if (direction == ScrollDirection.reverse) {
                    scrollNotifier.value = false;
                  } else if (direction == ScrollDirection.forward) {
                    scrollNotifier.value = true;
                  }
                  return true;
                },
                child: Stack(
                  children: [
                    FutureBuilder<List<DownloadModel>>(
                      future: trendingMoviesFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return const Center(child: Text('No data available'));
                        } else {
                          final trendingMovies = snapshot.data!;

                          return SingleChildScrollView(
                            child: Column(
                              children: [
                                BackGroundCard(
                                    backdropUrl:
                                        'https://image.tmdb.org/t/p/w500${trendingMovies[9].posterPath}'),
                                kHeight,
                                HomeMainCard(
                                    title: 'Released in the past year',
                                    movies: trendingMovies),
                                HomeMainCard(
                                    title: 'Trending Now',
                                    movies: trendingMovies),
                                const HomeCustomCard(
                                    title: 'Top 10 TV Shows In India Today'),
                                HomeMainCard(
                                    title: "Tense Dramas",
                                    movies: trendingMovies),
                                HomeMainCard(
                                    title: 'South Indian Cinema',
                                    movies: trendingMovies),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                    value
                        ? Container(
                            width: double.infinity,
                            height: 90,
                            color: Colors.black.withOpacity(0.5),
                            child: Center(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Image(
                                        height: 60,
                                        width: 60,
                                        image: NetworkImage(
                                            'https://www.freepnglogos.com/uploads/netflix-logo-circle-png-5.png'),
                                      ),
                                      const Spacer(),
                                      const Icon(
                                        Icons.cast,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      kWidth,
                                      Container(
                                        color: Colors.blue,
                                        width: 25,
                                        height: 25,
                                      ),
                                    ],
                                  ),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Tv Shows',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Movies',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Catagories',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class BackGroundCard extends StatelessWidget {
  final String backdropUrl;

  const BackGroundCard({super.key, required this.backdropUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 600,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(backdropUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.add,
                      color: white,
                      size: 30,
                    ),
                    Text(
                      'My List',
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                ),
                TextButtonHome(),
                Column(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: white,
                      size: 30,
                    ),
                    Text(
                      'Info',
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
