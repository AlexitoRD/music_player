/*
 * Author: Alexander Dunbar
 * Date: 2022-10-29, 1:16 a.m.
 */

import 'package:flutter_test/flutter_test.dart';
import 'package:music_player/models/song.dart';

void main() {
  test('Doing a unit test', () async {
    final song = Song(filePath: 'to_file', artist: 'Phil Collins');
    expect(song.artist, 'Phil Collins');
  });
}
