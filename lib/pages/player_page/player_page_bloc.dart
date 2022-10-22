/*
 * Author: Alexander Dunbar
 * Date: 2022-10-22, 3:45 p.m.
 */

import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:music_player/models/song.dart';
import 'package:music_player/utils/events/events.dart';
import 'package:music_player/utils/events/global_event_bus.dart';
import 'package:rxdart/rxdart.dart';

class PlayerPageBloc {
  final AudioPlayer audioPlayer = AudioPlayer();

  final BehaviorSubject<Song> _currentSongSubject = BehaviorSubject<Song>();

  ValueStream<Song> get currentSong => _currentSongSubject;

  late StreamSubscription<GlobalEvent> _subscription;

  Future<void> init() async {
    _subscription = GlobalEventBus.events.listen((event) {
      if (event is PlayEvent) {
        _currentSongSubject.add(event.song);
      }
    });
  }

  Future<void> playSong() async {}

  Future<void> pauseSong() async {}

  void dispose() {
    _currentSongSubject.close();
    _subscription.cancel();
  }
}
