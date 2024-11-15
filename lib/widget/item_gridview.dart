import 'package:flutter/material.dart';
import 'package:projet_tm/services/api/models_anime/anime_info.dart';
import 'package:projet_tm/views/anime_info_view.dart';

class Item extends StatelessWidget {
  final AnimeInfo anime;
  const Item({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    return IconButton(
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
        height: MediaQuery.sizeOf(context).height * 0.40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11.0),
          image: DecorationImage(
            image: NetworkImage(anime.images!.jpg.url),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(children: [
          Container(height: MediaQuery.sizeOf(context).height * 0.01),
          Container(
            color: Color.fromRGBO(15, 15, 15, 0.5),
            child: Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  anime.title.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  textAlign: TextAlign.center,
                  anime.score.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
