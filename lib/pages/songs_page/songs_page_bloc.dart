/*
 * Author: Alexander Dunbar
 * Date: 2022-10-22, 1:11 a.m.
 */

import 'dart:async';

import 'package:music_player/database_service/song_service.dart';
import 'package:music_player/models/song.dart';
import 'package:music_player/utils/events/events.dart';
import 'package:music_player/utils/events/global_event_bus.dart';
import 'package:music_player/utils/locator.dart';
import 'package:rxdart/rxdart.dart';

class SongsPageBloc {
  final SongService _songService = locator<SongService>();

  final BehaviorSubject<List<Song>> _allSongsSubject =
      BehaviorSubject<List<Song>>();

  ValueStream<List<Song>> get allSongs => _allSongsSubject;

  late StreamSubscription<GlobalEvent> _subscription;

  Future<void> init() async {
    _subscription = GlobalEventBus.events.listen((event) {
      if (event is ReloadMusicListEvent) {
        _updateSongList();
      }
    });
    final allSongs = await _songService.getAllSongs();
    _allSongsSubject.add(allSongs);
  }

  Future<void> removeSong(int? songID) async {
    if (songID != null) {
      await _songService.removeSong(songID);
      _updateSongList();
    }
  }

  Future<void> _updateSongList() async {
    final newSongList = await _songService.getAllSongs();
    _allSongsSubject.add(newSongList);
  }

  void playSong(Song song) {
    GlobalEventBus.sendEvent(PlayEvent(song: song));
  }

  void pauseSong() {
    GlobalEventBus.sendEvent(PauseEvent());
  }

  void dispose() {
    _allSongsSubject.close();
    _subscription.cancel();
  }
}
