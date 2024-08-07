import 'package:flutter/material.dart';
import 'package:projet_tm/services/api/models_anime/anime_info.dart';
import 'package:projet_tm/views/anime_info_view.dart';

class Item extends StatelessWidget {
  final AnimeInfo anime;
  const Item({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.28,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.black),
      child: Column(
        children: [
          Expanded(
            child: IconButton(
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AnimeDetail(
                          anime: anime,
                          list: const [],
                        ),
                      ));
                },
                icon: Container(
                  width: MediaQuery.sizeOf(context).width * 0.40,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Image.network(fit: BoxFit.fill, anime.images!.jpg.url),
                )),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(3, 0, 3, 2),
            child: Text(anime.title.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
                maxLines: 1),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(3, 0, 3, 2),
            child: Text(anime.score.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
                maxLines: 1),
          ),
        ],
      ),
    );
  }
}
