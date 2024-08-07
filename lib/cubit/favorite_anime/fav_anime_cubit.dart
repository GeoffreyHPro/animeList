import 'package:bloc/bloc.dart';
import 'package:projet_tm/cubit/favorite_anime/fav_anime_state.dart';
import 'package:projet_tm/services/sqlite/sqlite_call.dart';
import 'package:projet_tm/services/sqlite/sqlite_models/anime.dart';
import 'package:projet_tm/utils/globals.dart' as globals;

class FavAnimeCubit extends Cubit<FavAnimeState> {
  List<Anime> listAnime = [];

  FavAnimeCubit() : super(FavAnimeLoadedState(animeData: [])) {
    refresh();
    emit(FavAnimeLoadedState(animeData: listAnime));
  }

  refresh() async {
    listAnime = await animes(globals.database);
    emit(FavAnimeLoadedState(animeData: listAnime));
  }

  detail(Anime anime) async {
    emit(FavAnimeDetailState(animeData: anime));
  }
}
