/*
 * Author: Alexander Dunbar
 * Date: 2022-10-21, 10:27 p.m.
 */

import 'dart:typed_data';

class Song {
  final int? id;
  final String? title;
  final String? artist;
  final String? album;
  final int? year;
  final String filePath;
  final Uint8List? albumArt;

  Song({
    this.id,
    this.title,
    this.artist,
    this.album,
    this.year,
    required this.filePath,
    this.albumArt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'artist': artist,
      'album': album,
      'year': year,
      'filePath': filePath,
      'albumArt': albumArt,
    };
  }

  static Song fromDBResult(Map<String, dynamic> result) {
    return Song(
        id: result['id'],
        title: result['title'],
        artist: result['artist'],
        album: result['album'],
        year: result['year'],
        filePath: result['filePath'],
        albumArt: result['albumArt']);
  }
}
