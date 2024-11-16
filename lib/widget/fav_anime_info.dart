import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet_tm/cubit/favorite_anime/fav_anime_cubit.dart';
import 'package:projet_tm/services/sqlite/sqlite_call.dart';
import 'package:projet_tm/services/sqlite/sqlite_models/anime.dart';
import '../utils/globals.dart' as globals;

class FavAnimeInfo extends StatefulWidget {
  final Anime anime;
  const FavAnimeInfo({super.key, required this.anime});

  @override
  createState() => _FavAnimeInfoState();
}

class _FavAnimeInfoState extends State<FavAnimeInfo> {
  var icon = Icons.favorite;
  final String annotation = '';

  Widget getName() {
    if (widget.anime.title != null) {
      return Text(widget.anime.title!,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18));
    } else {
      return const Text("no name");
    }
  }

  Widget getScore() {
    if (widget.anime.score != null) {
      return Text(widget.anime.score!.toString(),
          style: TextStyle(color: Colors.white));
    } else {
      return const Text("no score");
    }
  }

  Widget getYear() {
    if (widget.anime.year != null) {
      return Text(widget.anime.year!.toString(),
          style: TextStyle(color: Colors.white));
    } else {
      return const Text("no year");
    }
  }

  Widget getDescription() {
    if (widget.anime.synopsis != null) {
      return Text(widget.anime.synopsis!.toString(),
          style: TextStyle(color: Colors.white));
    } else {
      return const Text("no description");
    }
  }

  @override
  Widget build(BuildContext context) {
    String annotation = widget.anime.annotation;
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          title: Row(
            children: [
              Expanded(
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () {
                    BlocProvider.of<FavAnimeCubit>(context).refresh();
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                    icon: Icon(
                      icon,
                      color: Colors.red,
                    ),
                    onPressed: () async {
                      setState(() {
                        HapticFeedback.selectionClick();
                        deleteAnimeByTitle(
                            globals.database, widget.anime.title!);
                        icon = Icons.favorite_border;
                      });
                      BlocProvider.of<FavAnimeCubit>(context).refresh();
                    }),
              )
            ],
          )),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: Image.file(File(widget.anime.image!)).image,
                fit: BoxFit.fill)),
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              color: const Color.fromRGBO(10, 10, 10, 0.8),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 25,
                            ),
                            getName(),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.60,
                      child: getDescription()),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.60,
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      maxLines: null,
                      initialValue: widget.anime.annotation,
                      keyboardType: TextInputType.multiline,
                      onChanged: (value) {
                        annotation = value.toString();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await updateAnnotation(
                          globals.database, annotation, widget.anime.title!);
                    },
                    child: const Text("sauvegarder"),
                    style:
                        ElevatedButton.styleFrom(foregroundColor: Colors.black),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
