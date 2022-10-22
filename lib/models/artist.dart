/*
 * Author: Alexander Dunbar
 * Date: 2022-10-21, 10:27 p.m.
 */

class Artist {
  final String name;

  Artist({required this.name});

  static Artist fromDBResult(Map<String, dynamic> result) {
    return Artist(name: result['artist']);
  }
}
