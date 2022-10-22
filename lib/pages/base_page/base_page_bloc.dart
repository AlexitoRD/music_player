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

  late StreamSubscription<GlobalEvent> _audioPlayerEvents;

  Future<void> init() async {
    _audioPlayerEvents = GlobalEventBus.events.listen((event) {
      if (event is PlayEvent) {
        print('Play event at ${event.filePath}');
        _audioPlayer.play(DeviceFileSource(event.filePath));
      }
      if (event is PauseEvent) {
        print('Pause event');
        _audioPlayer.pause();
      }
    });
  }

  void dispose() {
    _audioPlayerEvents.cancel();
  }
}
