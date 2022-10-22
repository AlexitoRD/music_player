/*
 * Author: Alexander Dunbar
 * Date: 2022-10-21, 10:27 p.m.
 */

class Song {
  final int? id;
  final String? title;
  final String? artist;
  final String filePath;

  Song({
    this.id,
    required this.title,
    required this.artist,
    required this.filePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'artist': artist,
      'filePath': filePath,
    };
  }

  static Song fromDBResult(Map<String, dynamic?> result) {
    // return Song(title: result['title'], artist: artist, filePath: filePath)
    throw UnimplementedError();
  }
}
