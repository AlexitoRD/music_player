/*
 * Author: Alexander Dunbar
 * Date: 2022-11-04, 12:06 a.m.
 */

import 'package:flutter_test/flutter_test.dart';
import 'package:music_player/models/song.dart';
import 'package:music_player/ui/pages/player_page/player_page_bloc.dart';
import 'package:music_player/utils/events/events.dart';
import 'package:music_player/utils/events/global_event_bus.dart';

import '../../../test_utils/test_utils.dart';

void main() {
  setUp(() {});

  tearDown(() {});

  test('Gets a Play event', () async {
    PlayerPageBloc bloc = PlayerPageBloc();
    await bloc.init();

    final Song song = Song(filePath: 'filePath');
    GlobalEventBus.sendEvent(PlayEvent(song: song));

    await Future.delayed(Duration.zero);

    expect(bloc.currentSong.value, song);
    expect(bloc.isPlaying.value, true);
  });

  test('Gets a Pause event', () async {
    PlayerPageBloc bloc = PlayerPageBloc();
    await bloc.init();

    GlobalEventBus.sendEvent(PauseEvent());
    await Future.delayed(Duration.zero);

    final result = bloc.isPlaying.value;

    expect(result, false);
  });

  test('Gets a Stop event', () async {
    PlayerPageBloc bloc = PlayerPageBloc();
    await bloc.init();

    GlobalEventBus.sendEvent(StopEvent());
    await Future.delayed(Duration.zero);

    final result = bloc.isPlaying.value;

    expect(result, false);
  });

  test('Gets a Resume event', () async {
    PlayerPageBloc bloc = PlayerPageBloc();
    await bloc.init();

    GlobalEventBus.sendEvent(ResumeEvent());
    await Future.delayed(Duration.zero);

    final result = bloc.isPlaying.value;

    expect(result, true);
  });

  test('Test dispose()', () async {
    PlayerPageBloc bloc = PlayerPageBloc();
    await bloc.init();

    bloc.dispose();

    expect(bloc.isPlaying, isClosed);
    expect(bloc.currentSong, isClosed);
  });
}
