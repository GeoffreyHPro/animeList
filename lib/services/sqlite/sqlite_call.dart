import 'package:sqflite/sqflite.dart';

import 'sqlite_models/anime.dart';

Future<void> insertAnime(Anime anime, Database database) async {
  final db = database;
  await db.insert(
    'anime',
    anime.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

insert(Anime anime, Database database) async {
  await insertAnime(anime, database);
}

Future<List<Anime>> animes(Database database) async {
  final db = database;
  final List<Map<String, dynamic>> maps = await db.query('anime');
  return anime(maps);
}

Future<void> updateAnnotation(Database database, String annotation, String title) async {
  final db = database;
  final List<Map<String, dynamic>> maps =
      await db.rawQuery("UPDATE anime SET annotation=? WHERE title=?", [annotation,title]);
  return anime(maps);
}

Future<List<Anime>> getAnimeByTitle(Database database, String title) async {
  final db = database;

  final List<Map<String, dynamic>> maps =
      await db.rawQuery("SELECT * FROM anime WHERE title=?", [title]);
  return anime(maps);
}

Future<List<Anime>> deleteAnimeByTitle(Database database, String title) async {
  final db = database;

  final List<Map<String, dynamic>> maps =
      await db.rawQuery("DELETE FROM anime WHERE title=?", [title]);
  return anime(maps);
}

anime(maps) {
  return List.generate(maps.length, (i) {
    return Anime(
      id: maps[i]['id'] as int?,
      title: maps[i]['title'] as String?,
      year: maps[i]['year'] as int?,
      score: maps[i]['score'] as double?,
      image: maps[i]['image'] as String?,
      annotation: maps[i]['annotation'] as String,
      synopsis:maps[i]['synopsis'] as String?
    );
  });
}
