/*
 * Author: Alexander Dunbar
 * Date: 2022-11-04, 7:06 p.m.
 */

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:music_player/models/song.dart';
import 'package:music_player/ui/pages/songs_page/songs_page.dart';
import 'package:music_player/utils/locator.dart';
import 'package:rxdart/rxdart.dart';

import '../../../mocks/bloc_setup.dart';
import '../../../mocks/mock_classes.dart';

void main() {
  late MockSongsPageBloc mockSongsPageBloc;

  setUp(() {
    mockSongsPageBloc = BlocSetup.setUpMockSongPageBloc();
  });

  tearDown(() {
    locator.reset();
  });

  testWidgets('Loads a list of songs', (widgetTester) async {
    when(() => mockSongsPageBloc.allSongs).thenAnswer(
      (_) => BehaviorSubject.seeded([
        Song(filePath: 'filePath', title: 'title1', artist: 'artist1'),
        Song(filePath: 'filePath', title: 'title2', artist: 'artist2')
      ]),
    );
    await widgetTester.pumpWidget(MaterialApp(
      home: Scaffold(body: SongsPage()),
    ));

    await widgetTester.pump();

    expect(find.byType(SongsPage), findsOneWidget);
    expect(find.byType(ListTile), findsNWidgets(2));
  });

  testWidgets('Tapping a tile plays the song', (widgetTester) async {
    List<Song> songs = [
      Song(filePath: 'filePath', title: 'title1', artist: 'artist1'),
      Song(filePath: 'filePath', title: 'title2', artist: 'artist2')
    ];
    when(() => mockSongsPageBloc.allSongs).thenAnswer(
      (_) => BehaviorSubject.seeded(songs),
    );
    await widgetTester.pumpWidget(MaterialApp(
      home: Scaffold(body: SongsPage()),
    ));

    await widgetTester.pump();

    await widgetTester.tap(find.byType(ListTile).first);

    verify(() => mockSongsPageBloc.playSong(songs.first)).called(1);
  });

  testWidgets('Long pressing a tile deletes the song', (widgetTester) async {
    List<Song> songs = [
      Song(filePath: 'filePath', title: 'title1', artist: 'artist1'),
      Song(filePath: 'filePath', title: 'title2', artist: 'artist2')
    ];
    when(() => mockSongsPageBloc.allSongs).thenAnswer(
      (_) => BehaviorSubject.seeded(songs),
    );
    await widgetTester.pumpWidget(MaterialApp(
      home: Scaffold(body: SongsPage()),
    ));

    await widgetTester.pump();

    await widgetTester.longPress(find.byType(ListTile).last);

    verify(() => mockSongsPageBloc.removeSong(songs.last.id)).called(1);
  });
}
