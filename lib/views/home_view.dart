import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet_tm/cubit/home_page/anime_cubit.dart';
import 'package:projet_tm/cubit/home_page/anime_state.dart';
import 'package:projet_tm/services/api/filter.dart';
import 'package:projet_tm/services/sqlite/sqlite_call.dart';
import 'package:projet_tm/services/sqlite/sqlite_models/anime.dart';
import 'package:projet_tm/views/anime_info_view.dart';
import 'package:projet_tm/views/favorite_anime.dart';
import 'package:projet_tm/views/filter_view.dart';
import 'package:projet_tm/widget/grid_anime.dart';
import 'package:projet_tm/widget/snackbar_home_view.dart';
import '../utils/globals.dart' as globals;

class MyHomePage extends StatelessWidget {
  final List<Anime> list = [];

  MyHomePage({super.key});

  refreshList(list) async {
    var animeDb = await getAnimeByTitle(globals.database, list);
    list = animeDb;
  }

  @override
  Widget build(BuildContext context) {
    AppBar app(BuildContext context, state) {
      return AppBar(
        backgroundColor: Colors.black,
        actions: [
          Expanded(
            child: IconButton(
              icon: const Icon(
                Icons.star_purple500_outlined,
                color: Colors.white,
              ),
              onPressed: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FavoriteAnime(),
                    ));
              },
            ),
          ),
          Expanded(
            child: IconButton(
                onPressed: () async {
                  BlocProvider.of<AnimeCubit>(context).animesFilter(
                      state.filter, state.animeData.pagination.currentPage - 1);
                },
                icon: const Icon(
                  Icons.arrow_left,
                  color: Colors.white,
                )),
          ),
          Expanded(
            child: IconButton(
                onPressed: () async {
                  BlocProvider.of<AnimeCubit>(context).animesFilter(
                      state.filter, state.animeData.pagination.currentPage + 1);
                },
                icon: const Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                )),
          ),
          Expanded(
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FilterView(),
                      ));
                },
                icon: const Icon(
                  Icons.manage_search_sharp,
                  color: Colors.white,
                )),
          ),
        ],
      );
    }

    return BlocConsumer<AnimeCubit, AnimeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var button = TextButton(
            onPressed: () async {
              try {
                final result = await InternetAddress.lookup('example.com');
                if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {}
              } on SocketException catch (_) {
                final snackBar = snackBarPage();

                // Find the ScaffoldMessenger in the widget tree
                // and use it to show a SnackBar.
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
              BlocProvider.of<AnimeCubit>(context)
                  .animesFilter(Filter(name: "", scoreMax: 10, scoreMin: 0), 1);
            },
            child: const Center(
              child: Text("Refresh"),
            ));

        if (state is AnimeInitialState) {
          return Scaffold(
            body: button,
            appBar: app(context, state),
          );
        } else if (state is AnimeLoadedState) {
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: app(context, state),
              body: GridAnime(listAnime: state.animeData.data));
        } else if (state is DetailAnimeState) {
          refreshList(state.animeinfo.title);
          return AnimeDetail(
            anime: state.animeinfo,
            list: const [],
          );
        } else if (state is AnimeLoadingState) {
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: app(context, state),
              body: const Center(
                  child: CircularProgressIndicator(
                color: Colors.black,
              )));
        } else {
          return const Text("");
        }
      },
    );
  }
}
