/*
 * Author: Alexander Dunbar
 * Date: 2022-10-21, 11:14 p.m.
 */

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  final _dbVersion = 1;

  Future<Database> openDb() async {
    return openDatabase(
      join(await getDatabasesPath(), 'music_player_database.db'),
      version: _dbVersion,
      onCreate: (db, version) {
        return db.execute(createDB1);
      },
    );
  }

  static String createDB1 =
      'CREATE TABLE songs(id INTEGER AUTO_INCREMENT PRIMARY KEY, '
      'title TEXT, '
      'artist TEXT, '
      'filePath Text';
}
