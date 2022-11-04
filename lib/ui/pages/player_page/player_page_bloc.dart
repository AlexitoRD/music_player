/*
 * Author: Alexander Dunbar
 * Date: 2022-10-22, 3:45 p.m.
 */

import 'dart:async';

import 'package:music_player/models/song.dart';
import 'package:music_player/utils/events/events.dart';
import 'package:music_player/utils/events/global_event_bus.dart';
import 'package:rxdart/rxdart.dart';

class PlayerPageBloc {
  final BehaviorSubject<Song> _currentSongSubject = BehaviorSubject<Song>();
  final BehaviorSubject<bool> _isPlayingSubject = BehaviorSubject<bool>();

  ValueStream<Song> get currentSong => _currentSongSubject;

  ValueStream<bool> get isPlaying => _isPlayingSubject;

  late StreamSubscription<GlobalEvent> _subscription;

  Future<void> init() async {
    _subscription = GlobalEventBus.events.listen((event) {
      if (event is PlayEvent) {
        _currentSongSubject.add(event.song);
        _isPlayingSubject.add(true);
      }
      if (event is PauseEvent || event is StopEvent) {
        _isPlayingSubject.add(false);
      }
      if (event is ResumeEvent) {
        _isPlayingSubject.add(true);
      }
    });
  }

  void dispose() {
    _currentSongSubject.close();
    _subscription.cancel();
  }
}
