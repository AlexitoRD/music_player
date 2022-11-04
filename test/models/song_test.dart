/*
 * Author: Alexander Dunbar
 * Date: 2022-10-29, 1:16 a.m.
 */

import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:music_player/models/song.dart';

void main() {
  test('Doing a unit test', () async {
    final song = Song(filePath: 'to_file', artist: 'Phil Collins');
    expect(song.artist, 'Phil Collins');
  });

  test('Test can create a map from a song', () async {
    final song = Song(
        filePath: 'file_path',
        id: 1,
        title: 'title',
        artist: 'artist',
        album: 'album',
        year: 1991,
        albumArt: Uint8List(3));
    final result = song.toMap();
    expect(result, {
      'id': 1,
      'title': 'title',
      'artist': 'artist',
      'album': 'album',
      'year': 1991,
      'filePath': 'file_path',
      'albumArt': [0, 0, 0]
    });
  });

  test('Test can create a Song from a map', () async {
    final song = Song.fromDBResult({
      'id': 1,
      'title': 'title',
      'artist': 'artist',
      'album': 'album',
      'year': 1991,
      'filePath': 'file_path',
      'albumArt': Uint8List(12),
    });
    expect(song.artist, 'artist');
    expect(song.id, 1);
  });
}
