import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet_tm/cubit/favorite_anime/fav_anime_cubit.dart';
import 'package:projet_tm/cubit/favorite_anime/fav_anime_state.dart';
import 'package:projet_tm/widget/fav_anime_info.dart';
import 'package:projet_tm/widget/item_listview.dart';

import 'package:flutter/material.dart';

class FavoriteAnime extends StatelessWidget {
  const FavoriteAnime({super.key});

  getFavoris(List animes) {
    if (animes.isEmpty) {
      return const Center(child: Text("Pas d'animés en favoris"));
    } else {
      return ListView.separated(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        itemCount: animes.length,
        itemBuilder: (BuildContext context, int index) {
          return Item(anime: animes[index], blocContext: context);
        },
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(color: Colors.transparent),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavAnimeCubit, FavAnimeState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is FavAnimeInitialState) {
            return const Text("Problème dans la base de données");
          } else if (state is FavAnimeLoadedState) {
            return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.black,
                  iconTheme: const IconThemeData(color: Colors.white),
                ),
                backgroundColor: Colors.white,
                body: getFavoris(state.animeData));
          } else if (state is FavAnimeDetailState) {
            return FavAnimeInfo(anime: state.animeData);
          } else {
            return const Text("non");
          }
        });
  }
}
