/*
 * Author: Alexander Dunbar
 * Date: 2022-10-22, 1:11 a.m.
 */

import 'package:music_player/database_service/song_service.dart';
import 'package:music_player/utils/locator.dart';

class SongsPageBloc {
  final SongService _songService = locator<SongService>();

  Future<void> init() async {}

  Future<void> getAllSongs() async {
    await _songService.getAllSongs();
  }
}
