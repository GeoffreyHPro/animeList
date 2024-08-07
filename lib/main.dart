import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projet_tm/app.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'utils/globals.dart' as globals;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  globals.database = await openDatabase(
    join(await getDatabasesPath(), 'anime_db.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE anime(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title TEXT, year INTEGER, score FLOAT, image TEXT, annotation TEXT, synopsis TEXT )',
      );
    },
    version: 1,
  );

  SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

  

  runApp(const MyApp());
}
