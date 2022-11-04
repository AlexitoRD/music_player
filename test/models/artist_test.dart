/*
 * Author: Alexander Dunbar
 * Date: 2022-11-03, 11:18 p.m.
 */

import 'package:flutter_test/flutter_test.dart';
import 'package:music_player/models/artist.dart';

void main() {
  test('Test can crate an Artist from the fromDBResult method', () {
    final artist = Artist.fromDBResult({'artist': 'artist_name'});
    expect(artist.name, 'artist_name');
  });
}
