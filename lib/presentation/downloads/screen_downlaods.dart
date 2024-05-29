import 'dart:math';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/downloads/api.dart';
import 'package:netflix/domain/downloads/models/model.dart';
import 'package:netflix/presentation/common%20widgets/app_bar_widget.dart';

class ScreenDownloads extends StatefulWidget {
  const ScreenDownloads({super.key});

  @override
  State<ScreenDownloads> createState() => _ScreenDownloadsState();
}

class _ScreenDownloadsState extends State<ScreenDownloads> {
  late Future<List<DownloadModel>> downloadPage;

  @override
  void initState() {
    downloadPage = Api().getTrending();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidget(
              title: "Downloads",
            )),
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: FutureBuilder<List<DownloadModel>>(
            future: downloadPage,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No movies found'));
              } else {
                final movies = snapshot.data!;
                return ListView(
                  children: [
                    kHeight,
                    const _SmartDownloads(),
                    const SizedBox(height: 25),
                    const Text(
                      textAlign: TextAlign.center,
                      'Introducing Downloads for you',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      longSent,
                      style: TextStyle(fontSize: 17, color: grey),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: size.width,
                      width: size.width,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: greytext.shade600,
                            radius: size.width * .4,
                          ),
                          if (movies.isNotEmpty)
                            DownloadsPosterWidget(
                              margin:
                                  const EdgeInsets.only(left: 160, bottom: 20),
                              angle: 20,
                              width: .4,
                              height: .6,
                              image: '$imageUrl${movies[0].posterPath}',
                            ),
                          if (movies.length > 2)
                            DownloadsPosterWidget(
                              margin:
                                  const EdgeInsets.only(right: 160, bottom: 20),
                              angle: -20,
                              width: .4,
                              height: .6,
                              image: '$imageUrl${movies[1].posterPath}',
                            ),
                          if (movies.length > 1)
                            DownloadsPosterWidget(
                              margin: const EdgeInsets.only(bottom: 1),
                              width: .5,
                              height: .6,
                              image: '$imageUrl${movies[2].posterPath}',
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: buttonColor,
                        onPressed: () {},
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Set up',
                            style: TextStyle(
                                color: white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    kHeight,
                    Padding(
                      padding: const EdgeInsets.only(right: 35, left: 35),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: white,
                        onPressed: () {},
                        child: const Text(
                          'See what you can Download',
                          style: TextStyle(
                              color: black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.settings,
          color: buttonWhite,
        ),
        kWidth,
        Text(
          'Smart Downloads',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class DownloadsPosterWidget extends StatelessWidget {
  const DownloadsPosterWidget({
    super.key,
    this.angle = 0,
    required this.margin,
    required this.height,
    required this.width,
    required this.image,
  });

  final double angle;
  final EdgeInsets margin;
  final double width;
  final double height;
  final String image;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width * width,
        height: size.width * height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
