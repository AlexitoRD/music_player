/*
 * Author: Alexander Dunbar
 * Date: 2022-10-22, 5:07 p.m.
 */

import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:music_player/utils/events/events.dart';
import 'package:music_player/utils/events/global_event_bus.dart';
import 'package:music_player/utils/locator.dart';

class BasePageBloc {
  final AudioPlayer _audioPlayer = locator<AudioPlayer>();

  late StreamSubscription<GlobalEvent> _globalEvents;

  Future<void> init() async {
    _globalEvents = GlobalEventBus.events.listen((event) async {
      if (event is PlayEvent) {
        _audioPlayer.play(DeviceFileSource(event.song.filePath));
      }
      if (event is PauseEvent) {
        _audioPlayer.pause();
      }
      if (event is ResumeEvent) {
        _audioPlayer.resume();
      }
    });
  }

  void dispose() {
    _globalEvents.cancel();
    _audioPlayer.release();
  }
}
