import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/downloads/models/model.dart';

class Api {
  static const _trendingUrl =
      "https://api.themoviedb.org/3/trending/movie/week?api_key=$apikey";
  static const _topSearchesUrl =
      "https://api.themoviedb.org/3/movie/popular?api_key=$apikey";

  Future<List<DownloadModel>> getTrending() async {
    final response = await http.get(Uri.parse(_trendingUrl));

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)["results"] as List;
      return decodedData
          .map((downloadModel) => DownloadModel.fromJson(downloadModel))
          .toList();
    } else {
      throw Exception('Failed to load trending movies');
    }
  }

  Future<List<DownloadModel>> getTopSearches() async {
    final response = await http.get(Uri.parse(_topSearchesUrl));

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)["results"] as List;
      return decodedData
          .map((downloadModel) => DownloadModel.fromJson(downloadModel))
          .toList();
    } else {
      throw Exception('Failed to load top searches');
    }
  }
}
