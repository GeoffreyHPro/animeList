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
            fit: BoxFit.fill,
          ),
        ),
        child: Column(children: [
          Container(height: MediaQuery.sizeOf(context).height * 0.01),
          Row(
            children: [
              Expanded(child: SizedBox()),
              Expanded(child: SizedBox()),
              Expanded(
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 20,
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Text(anime.score.toString())),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
