import 'package:dio/dio.dart';
import 'package:projet_tm/services/api/filter.dart';

var dio = Dio();

Future<Response> getAllAnime() {
  return dio.get("https://api.jikan.moe/v4/anime");
}

Future<Response> getAnimeFilter(Filter filter) {
  return dio.get(
      "https://api.jikan.moe/v4/anime?q=${filter.name}&min_score=${filter.scoreMin}&max_score=${filter.scoreMax}");
}

Future<Response> getAnimeFilterPage(Filter filter, int page) {
  List<String> order = filter.order.split('_');
  String request = "https://api.jikan.moe/v4/anime?q=${filter.name}&min_score=${filter.scoreMin}&max_score=${filter.scoreMax}&page=$page";
  if(filter.order != "none"){
    request += "&sort=${order[0]}&order_by=${order[1]}";
  }
  if (filter.type != "" && filter.type != "all") {
    request += "&type=${filter.type}";
  }
  return dio.get(request);
}
