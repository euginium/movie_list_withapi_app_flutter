import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/constant.dart';
import 'package:movie_app/models/top_rated.dart';
import 'package:movie_app/models/upcoming_titles_model.dart';
import 'package:movie_app/models/trending_model.dart';

class NetworkHelper {
  var upcoming_url =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${api_key}&language=en-US&page=1';
  List<UpcomingTitles> upcomingTitles = [];

  //get the upcoming title api data here
  Future<void> getUpcomingData() async {
    try {
      http.Response response = await http.get(upcoming_url);
      var results = response.body;
      var decodeResults = jsonDecode(results)['results'];
      for (var element in decodeResults) {
        UpcomingTitles upcoming = UpcomingTitles(
            title: element['title'],
            releaseDate: element['release_date'],
            imgUrl: element['backdrop_path'],
            description: element['overview'],
            language: element['original_language']);
        upcomingTitles.add(upcoming);
        print(upcomingTitles.length);
      }
    } catch (e) {
      print(e);
    }
  }

  var toprated_url =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${api_key}&language=en-US&page=1';
  List<TopRated> top = [];

  //get the topRated api data here
  Future<void> getRecommendData() async {
    try {
      http.Response response = await http.get(toprated_url);
      var results = response.body;
      var decodeResult = jsonDecode(results)['results'];
      for (var elements in decodeResult) {
        TopRated topRated = new TopRated(
          title: elements['title'],
          imgUrl: elements['poster_path'],
          popularity: elements['vote_average'],
          language: elements['original_language'],
          description: elements['overview'],
        );
        top.add(topRated);
        print(top.length);
      }
    } catch (e) {
      print(e);
    }
  }

  List<TrendingModel> trend = [];
  var trend_url =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${api_key}';
  //get the trending api data here
  Future<void> getTrendData() async {
    try {
      http.Response response = await http.get(trend_url);
      var results = response.body;
      var decodeResult = jsonDecode(results)['results'];
      for (var elements in decodeResult) {
        TrendingModel trendingModel = new TrendingModel(
          title: elements['title'],
          imgUrl: elements['poster_path'],
          rating: elements['vote_average'],
          description: elements['overview'],
          language: elements['original_language'],
        );
        trend.add(trendingModel);
      }
    } catch (e) {
      print(e);
    }
  }
}
