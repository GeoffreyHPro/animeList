import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet_tm/cubit/favorite_anime/fav_anime_cubit.dart';
import 'package:projet_tm/services/api/models_anime/anime_info.dart';
import 'package:projet_tm/services/sqlite/sqlite_models/anime.dart';
import 'package:projet_tm/utils/download_file.dart';
import 'package:projet_tm/widget/info.dart';
import '../utils/globals.dart' as globals;
import '../services/sqlite/sqlite_call.dart';

class AnimeDetail extends StatefulWidget {
  final AnimeInfo anime;
  final List<Anime> list;

  const AnimeDetail({super.key, required this.anime, required this.list});

  @override
  createState() => _AnimeDetailState();
}

class _AnimeDetailState extends State<AnimeDetail> {
  var icon = Icons.favorite_border;

  @override
  Widget build(BuildContext context) {
    getList() async {
      var list = await getAnimeByTitle(globals.database, widget.anime.title!);
      setState(() {
        if (list.isEmpty) {
          icon = Icons.favorite_border;
        } else {
          icon = Icons.favorite;
        }
      });
    }

    getList();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          actions: [
            Expanded(
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.white),
            ),
            Expanded(
              child: IconButton(
                  icon: Icon(
                    icon,
                    color: Colors.red,
                  ),
                  onPressed: () async {
                    var list = await getAnimeByTitle(
                        globals.database, widget.anime.title!);
                    var futurePath = downloadFile(
                        widget.anime.images!.jpg.url, '${widget.anime.id}.jpg');

                    String path = await futurePath;
                    HapticFeedback.selectionClick();

                    setState(() {
                      if (list.isEmpty) {
                        var a = Anime(
                            title: widget.anime.title,
                            year: widget.anime.year,
                            score: widget.anime.score,
                            id: null,
                            image: path,
                            synopsis: widget.anime.synopsis,
                            annotation: '');
                        insertAnime(a, globals.database);
                        icon = Icons.favorite;
                      } else {
                        deleteAnimeByTitle(
                            globals.database, widget.anime.title!);
                        icon = Icons.favorite_border;
                      }
                    });
                    BlocProvider.of<FavAnimeCubit>(context).refresh();
                  }),
            )
          ],
        ),
        body: Info(anime: widget.anime));
  }
}
