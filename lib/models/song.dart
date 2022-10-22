/*
 * Author: Alexander Dunbar
 * Date: 2022-10-21, 10:27 p.m.
 */

class Song {
  final int? id;
  final String? title;
  final String? artist;
  final String? album;
  final int? year;
  final String filePath;

  Song({
    this.id,
    this.title,
    this.artist,
    this.album,
    this.year,
    required this.filePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'artist': artist,
      'album': album,
      'year': year,
      'filePath': filePath,
    };
  }

  static Song fromDBResult(Map<String, dynamic> result) {
    return Song(
        id: result['id'],
        title: result['title'],
        artist: result['artist'],
        album: result['album'],
        year: result['year'],
        filePath: result['filePath']);
  }
}
