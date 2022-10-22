/*
 * Author: Alexander Dunbar
 * Date: 2022-10-21, 11:00 p.m.
 */

import 'package:music_player/database_service/database_service.dart';
import 'package:music_player/models/album.dart';
import 'package:music_player/models/artist.dart';

import '../models/song.dart';
import '../utils/locator.dart';

class SongService {
  final DatabaseService _databaseService = locator<DatabaseService>();

  Future<void> addSong(Song song) async {
    final db = await _databaseService.openDb();
    await db.insert('songs', song.toMap());
  }

  Future<List<Song>> getAllSongs() async {
    final db = await _databaseService.openDb();
    List<Song> songs = [];
    final results = await db.rawQuery('SELECT * FROM songs');
    for (Map<String, dynamic> song in results) {
      songs.add(Song.fromDBResult(song));
    }
    return songs;
  }

  Future<void> removeSong(int songID) async {
    final db = await _databaseService.openDb();
    await db.rawDelete('DELETE FROM songs WHERE id = ?', [songID]);
  }

  Future<List<Album>> getAllAlbums() async {
    final db = await _databaseService.openDb();
    List<Album> albums = [];
    final results = await db.rawQuery('SELECT artist, album, year, FROM songs');
    for (Map<String, dynamic> album in results) {
      albums.add(Album.fromDBResult(album));
    }
    return albums;
  }

  Future<List<Artist>> getAllArtists() async {
    final db = await _databaseService.openDb();
    List<Artist> artists = [];
    final results = await db.rawQuery('SELECT artist FROM SONGS');
    print('Empty ${results.isEmpty}');
    for (Map<String, dynamic> artist in results) {
      artists.add(Artist.fromDBResult(artist));
    }
    return artists;
  }
}
