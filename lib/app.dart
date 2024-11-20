import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet_tm/cubit/favorite_anime/fav_anime_cubit.dart';
import 'package:projet_tm/cubit/home_page/anime_cubit.dart';
import 'package:projet_tm/views/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AnimeCubit()),
        BlocProvider(create: (context) => FavAnimeCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Anime',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
