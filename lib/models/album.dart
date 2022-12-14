/*
 * Author: Alexander Dunbar
 * Date: 2022-10-21, 10:31 p.m.
 */

class Album {
  final String name;
  final String artist;
  final int year;

  Album({required this.name, required this.artist, required this.year});

  static Album fromDBResult(Map<String, dynamic> result) {
    return Album(
      name: result['album'],
      artist: result['artist'],
      year: result['year'],
    );
  }
}
