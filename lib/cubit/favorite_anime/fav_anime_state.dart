import 'package:projet_tm/services/sqlite/sqlite_call.dart';
import 'package:projet_tm/services/sqlite/sqlite_models/anime.dart';
import 'package:projet_tm/utils/globals.dart' as globals;

abstract class FavAnimeState {}

class FavAnimeInitialState extends FavAnimeState {
  List<Anime> animeData = List.empty();
}

class FavAnimeLoadedState extends FavAnimeState {
  List<Anime> animeData;

  FavAnimeLoadedState({required this.animeData}) {
    init();
  }
  init() async {
    animeData = await animes(globals.database);
  }
}

class FavAnimeDetailState extends FavAnimeState {
  final Anime animeData;

  FavAnimeDetailState({required this.animeData});
}
