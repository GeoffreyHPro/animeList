import 'package:bloc/bloc.dart';
import 'package:projet_tm/cubit/home_page/anime_state.dart';
import 'package:projet_tm/services/api/call/call.dart';
import 'package:projet_tm/services/api/filter.dart';
import 'package:projet_tm/services/api/models_anime/anime_data.dart';
import 'package:projet_tm/services/api/models_anime/anime_info.dart';
import 'package:projet_tm/services/api/models_anime/pagination.dart';

class AnimeCubit extends Cubit<AnimeState> {
  AnimeData? animeData = AnimeData(
      data: List.empty(),
      pagination: Pagination(lastPage: 1, nextPage: false, currentPage: 1));
  AnimeInfo? animeInfo;

  AnimeCubit() : super(AnimeInitialState());

  animesFilter(Filter filter, int page) async {
    try {
      if (page > 0 && page <= animeData!.pagination.lastPage) {
        if ((page <= animeData!.pagination.lastPage)) {
          var result = await getAnimeFilterPage(filter, page);
          var data = AnimeData.fromJson(result.data);
          animeData = data;
          emit(AnimeLoadingState());
          await getAnimeFilterPage(filter, page);
          emit(AnimeLoadedState(animeData: data, filter: filter));
        }
      }
    } catch (e) {
      emit(AnimeInitialState());
    }
  }

  animeDetail(AnimeInfo animeInfo) async {
    emit(DetailAnimeState(animeinfo: animeInfo));
  }
}
