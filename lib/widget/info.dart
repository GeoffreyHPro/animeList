import 'package:flutter/material.dart';
import 'package:projet_tm/services/api/models_anime/anime_info.dart';

class Info extends StatelessWidget {
  final AnimeInfo anime;

  const Info({super.key, required this.anime});

  Text getDescription() {
    if (anime.synopsis != null) {
      var taille = anime.synopsis!.length;

      if (taille < 300) {
        return Text(anime.synopsis!.substring(0, taille),
            style: const TextStyle());
      } else {
        return Text(anime.synopsis!.substring(0, 300),
            style: const TextStyle());
      }
    }
    return const Text("");
  }

  Widget getYear() {
    if (anime.year != null) {
      return Text(anime.year!.toString());
    } else {
      return const Text("no year");
    }
  }

  Widget getScore() {
    if (anime.score != null) {
      return Text(anime.score!.toString());
    } else {
      return const Text("no score");
    }
  }

  Widget getEpisode() {
    if (anime.episodes != null) {
      return Text("${anime.episodes!.toString()} épisodes");
    } else {
      return const Text("??? épisodes");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 35),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(
                anime.images!.jpg.url,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.85,
              child: Center(
                child: Text(
                  anime.title!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.85,
              child: Row(
                children: [
                  Expanded(child: getYear()),
                  Expanded(child: getScore()),
                  Expanded(child: getEpisode())
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.85,
                child: getDescription()),
          ],
        ),
      ),
    );
  }
}
