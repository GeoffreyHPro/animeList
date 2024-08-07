import 'package:projet_tm/services/api/filter.dart';
import 'package:projet_tm/services/api/models_anime/anime_data.dart';
import 'package:projet_tm/services/api/models_anime/anime_info.dart';

abstract class AnimeState {}

class AnimeInitialState extends AnimeState {}

class AnimeLoadingState extends AnimeState {}

class AnimeLoadedState extends AnimeState {
  final AnimeData animeData;
  final Filter filter;

  AnimeLoadedState({required this.animeData, required this.filter});
}

class DetailAnimeState extends AnimeState {
  final AnimeInfo animeinfo;

  DetailAnimeState({required this.animeinfo});
}
