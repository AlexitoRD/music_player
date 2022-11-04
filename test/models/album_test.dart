/*
 * Author: Alexander Dunbar
 * Date: 2022-11-03, 11:41 p.m.
 */

import 'package:flutter_test/flutter_test.dart';
import 'package:music_player/models/album.dart';

void main() {
  test('Test the Album fromDBResult method', () async {
    final album = Album.fromDBResult(
        {'album': 'album', 'artist': 'artist', 'year': 1991});

    expect(album.name, 'album');
    expect(album.artist, 'artist');
    expect(album.year, 1991);
  });
}
