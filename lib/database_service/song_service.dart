/*
 * Author: Alexander Dunbar
 * Date: 2022-10-21, 11:00 p.m.
 */

import 'package:music_player/database_service/database_service.dart';

import '../models/song.dart';
import '../utils/locator.dart';

class SongService {
  final DatabaseService _databaseService = locator<DatabaseService>();

  Future<void> addSong(Song song) async {
    final db = await _databaseService.openDb();
    await db.insert('songs', song.toMap());
  }

  Future<void> getAllSongs() async {
    final db = await _databaseService.openDb();
    final results = await db.rawQuery('SELECT * FROM songs');
    print(results.first);
  }
}
