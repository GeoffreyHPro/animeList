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
      height: MediaQuery.sizeOf(context).height * 0.2,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(15)),
      child: Row(children: [
        InkWell(
            onTap: () {
              BlocProvider.of<FavAnimeCubit>(context).detail(anime);
            },
            child:
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.file(File(anime.image!)
              )
             
            ,)
        ),
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
