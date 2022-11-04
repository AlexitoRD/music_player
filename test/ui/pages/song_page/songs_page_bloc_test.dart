/*
 * Author: Alexander Dunbar
 * Date: 2022-11-04, 7:06 p.m.
 */

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:music_player/models/song.dart';
import 'package:music_player/ui/pages/songs_page/songs_page_bloc.dart';
import 'package:music_player/utils/events/events.dart';
import 'package:music_player/utils/events/global_event_bus.dart';
import 'package:music_player/utils/locator.dart';

import '../../../mocks/bloc_setup.dart';
import '../../../mocks/mock_classes.dart';
import '../../../test_utils/test_utils.dart';

void main() {
  late MockSongService mockSongService;

  setUp(() {
    mockSongService = BlocSetup.setUpMockSongService();
  });

  tearDown(() {
    locator.reset();
  });

  test('Test that init calls getAllSongs()', () async {
    List<Song> songs = [
      Song(filePath: 'filePath', title: 'song1'),
      Song(filePath: 'filePath', title: 'song2')
    ];
    when(() => mockSongService.getAllSongs()).thenAnswer(
      (invocation) => Future.value(songs),
    );
    SongsPageBloc bloc = SongsPageBloc();
    await bloc.init();
    await Future.delayed(Duration.zero);

    verify(() => mockSongService.getAllSongs()).called(1);
    expect(bloc.allSongs.value, songs);
  });

  test('Test that ReloadMusicListEvent calls _updateSongList()', () async {
    List<Song> songs = [
      Song(filePath: 'filePath', title: 'song1'),
      Song(filePath: 'filePath', title: 'song2')
    ];
    when(() => mockSongService.getAllSongs()).thenAnswer(
      (invocation) => Future.value(songs),
    );
    SongsPageBloc bloc = SongsPageBloc();
    await bloc.init();
    await Future.delayed(Duration.zero);

    songs.add(Song(filePath: 'filePath', title: 'song3'));
    when(() => mockSongService.getAllSongs()).thenAnswer(
      (invocation) => Future.value(songs),
    );

    GlobalEventBus.sendEvent(ReloadMusicListEvent());
    await Future.delayed(Duration.zero);

    verify(() => mockSongService.getAllSongs()).called(2);
  });

  test('Test removeSong', () async {
    when(() => mockSongService.removeSong(1)).thenAnswer((_) async {});
    List<Song> songs = [
      Song(filePath: 'filePath', title: 'song1'),
      Song(filePath: 'filePath', title: 'song2')
    ];
    when(() => mockSongService.getAllSongs()).thenAnswer(
      (invocation) => Future.value(songs),
    );

    SongsPageBloc bloc = SongsPageBloc();
    await bloc.init();
    await Future.delayed(Duration.zero);

    await bloc.removeSong(1);

    verify(() => mockSongService.getAllSongs()).called(2);
    verify(() => mockSongService.removeSong(1)).called(1);
  });

  test('Test playSong()', () async {
    SongsPageBloc bloc = SongsPageBloc();
    await bloc.init();
    await Future.delayed(Duration.zero);

    final song = Song(filePath: 'filePath');

    GlobalEventBus.events.listen((event) {
      if (event is PlayEvent) {
        expect(event.song, song);
      }
    });

    bloc.playSong(song);
  });

  test('Test pauseSong()', () async {
    SongsPageBloc bloc = SongsPageBloc();
    await bloc.init();
    await Future.delayed(Duration.zero);

    GlobalEventBus.events.listen((event) {
      if (event is PauseEvent) {
        expect(event.runtimeType, PauseEvent);
      }
    });

    bloc.pauseSong();
  });

  test('dispose()', () async {
    SongsPageBloc bloc = SongsPageBloc();
    await bloc.init();
    await Future.delayed(Duration.zero);

    bloc.dispose();
    await Future.delayed(Duration.zero);

    expect(bloc.allSongs, isClosed);
  });
}
