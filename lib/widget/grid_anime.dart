import 'package:flutter/material.dart';
import 'package:projet_tm/services/api/models_anime/anime_info.dart';
import 'package:projet_tm/widget/item_gridview.dart';

class GridAnime extends StatelessWidget {
  final List<AnimeInfo> listAnime;

  const GridAnime({super.key, required this.listAnime});

  @override
  Widget build(BuildContext context) {
    displayResult() {
      if (listAnime.isEmpty) {
        return const Center(child: Text("Aucun résultat avec ce filtre"));
      } else {
        return Container(
          child: GridView.count(
              padding: const EdgeInsets.fromLTRB(2, 10, 2, 10),
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: List.generate(listAnime.length, (index) {
                return Center(
                    child: Item(
                  anime: listAnime[index],
                ));
              })),
        );
      }
    }

    return SafeArea(child: displayResult());
  }
}
