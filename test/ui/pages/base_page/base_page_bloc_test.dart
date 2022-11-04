/*
 * Author: Alexander Dunbar
 * Date: 2022-11-04, 8:02 p.m.
 */

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:music_player/models/song.dart';
import 'package:music_player/ui/pages/base_page/base_page_bloc.dart';
import 'package:music_player/utils/events/events.dart';
import 'package:music_player/utils/events/global_event_bus.dart';
import 'package:music_player/utils/locator.dart';

import '../../../mocks/bloc_setup.dart';
import '../../../mocks/mock_classes.dart';

void main() {
  late MockAudioPlayer mockAudioPlayer;

  setUp(() {
    registerFallbackValue(DeviceFileSource('filePath'));
    mockAudioPlayer = BlocSetup.setUpMockAudioPlayer();
  });

  tearDown(() {
    locator.reset();
  });

  test('Test calls play from a PlayEvent', () async {
    BasePageBloc bloc = BasePageBloc();
    await bloc.init();
    await Future.delayed(Duration.zero);

    final song = Song(filePath: 'filePath');

    GlobalEventBus.sendEvent(PlayEvent(song: song));
    await Future.delayed(Duration.zero);

    verify(() => mockAudioPlayer.play(any())).called(1);
    bloc.dispose();
  });

  test('Test calls play from a PlayEvent', () async {
    BasePageBloc bloc = BasePageBloc();
    await bloc.init();
    await Future.delayed(Duration.zero);

    final song = Song(filePath: 'filePath');

    GlobalEventBus.sendEvent(PlayEvent(song: song));
    await Future.delayed(Duration.zero);

    verify(() => mockAudioPlayer.play(any())).called(1);
    bloc.dispose();
  });

  test('Test calls pause from a PauseEvent', () async {
    BasePageBloc bloc = BasePageBloc();
    await bloc.init();
    await Future.delayed(Duration.zero);

    GlobalEventBus.sendEvent(PauseEvent());
    await Future.delayed(Duration.zero);

    verify(() => mockAudioPlayer.pause()).called(1);
    bloc.dispose();
  });

  test('Test calls pause from a ResumeEvent', () async {
    BasePageBloc bloc = BasePageBloc();
    await bloc.init();
    await Future.delayed(Duration.zero);

    GlobalEventBus.sendEvent(ResumeEvent());
    await Future.delayed(Duration.zero);

    verify(() => mockAudioPlayer.resume()).called(1);
    bloc.dispose();
  });
}
