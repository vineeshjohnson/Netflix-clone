import 'package:flutter/material.dart';
import 'package:netflix/presentation/fast%20laughs/widgets/video_list_item.dart';
import 'package:netflix/domain/downloads/models/model.dart';
import 'package:netflix/domain/downloads/api.dart'; // Import your Api class

class ScreenFastLaughs extends StatefulWidget {
  const ScreenFastLaughs({super.key});

  @override
  State<ScreenFastLaughs> createState() => _ScreenFastLaughsState();
}

class _ScreenFastLaughsState extends State<ScreenFastLaughs> {
  late Future<List<DownloadModel>> moviesFuture;

  @override
  void initState() {
    moviesFuture =
        Api().getTrending(); // Assuming getTrending fetches DownloadModel data
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List<DownloadModel>>(
          future: moviesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No data available'));
            } else {
              List<DownloadModel> movies = snapshot.data!;

              return PageView(
                scrollDirection: Axis.vertical,
                children: List.generate(
                  movies.length,
                  (index) => VideoTile(
                    movie: movies[index],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
