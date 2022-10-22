/*
 * Author: Alexander Dunbar
 * Date: 2022-10-22, 1:11 a.m.
 */

import 'package:music_player/database_service/song_service.dart';
import 'package:music_player/models/song.dart';
import 'package:music_player/utils/locator.dart';
import 'package:rxdart/rxdart.dart';

class SongsPageBloc {
  final SongService _songService = locator<SongService>();

  final BehaviorSubject<List<Song>> _allSongsSubject =
      BehaviorSubject<List<Song>>();

  ValueStream<List<Song>> get allSongs => _allSongsSubject;

  Future<void> init() async {
    final allSongs = await _songService.getAllSongs();
    _allSongsSubject
        .add(allSongs); //TODO: Figure out why this tries to add after close.
  }

  Future<void> dispose() async {
    await _allSongsSubject.close();
  }
}
