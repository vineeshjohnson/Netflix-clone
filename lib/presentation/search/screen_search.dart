import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/downloads/api.dart';
import 'package:netflix/domain/downloads/models/model.dart';
import 'package:netflix/presentation/search/widgets/search_result.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

late Future<List<DownloadModel>> searchPage;

class _ScreenSearchState extends State<ScreenSearch> {
  @override
  void initState() {
    searchPage = Api().getTrending();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kHeight,
              CupertinoSearchTextField(
                padding: const EdgeInsets.all(10),
                itemSize: 25,
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey,
                ),
                style: const TextStyle(color: Colors.white),
                backgroundColor: Colors.grey.withOpacity(.5),
              ),
              kHeight,
              Expanded(
                child: FutureBuilder<List<DownloadModel>>(
                  future: searchPage,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No data found'));
                    } else {
                      // return SearchIdleWidget(movies: snapshot.data!);
                      return SearchResultWidget(movies: snapshot.data!);
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
