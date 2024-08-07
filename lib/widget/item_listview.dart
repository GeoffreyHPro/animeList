import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet_tm/cubit/favorite_anime/fav_anime_cubit.dart';
import 'package:projet_tm/services/sqlite/sqlite_models/anime.dart';

class Item extends StatelessWidget {
  final Anime anime;
  final BuildContext blocContext;

  const Item({super.key, required this.anime, required this.blocContext});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.fromLTRB(0, 20, 10, 10),
      child: Row(children: [
        Expanded(
            child: InkWell(
                onTap: () {
                  BlocProvider.of<FavAnimeCubit>(context).detail(anime);
                },
                child: Image.file(height: 150, File(anime.image!)))),
        Expanded(
            child: Center(
          child: Column(
            children: [
              Text(anime.title!, style: const TextStyle(color: Colors.white)),
              Text("${anime.score}",
                  style: const TextStyle(color: Colors.white)),
            ],
          ),
        )),
      ]),
    );
  }
}
