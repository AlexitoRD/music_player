/*
 * Author: Alexander Dunbar
 * Date: 2022-10-21, 10:07 p.m.
 */

/*
 * Author: Alexander Dunbar
 * Date: 2022-10-18, 8:36 p.m.
 */

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_player/pages/albums_page/albums_page.dart';
import 'package:music_player/pages/artists_page/artists_page.dart';
import 'package:music_player/pages/playlists_page/playlists_page.dart';
import 'package:music_player/pages/songs_page/songs_page.dart';
import 'package:music_player/widgets/main_menu_drawer/main_menu_drawer.dart';

void main() {
  setUp(() {});

  tearDown(() {});

  testWidgets('Widget builds correctly', (widgetTester) async {
    await widgetTester.pumpWidget(const MaterialApp(
      home: MainMenuDrawer(),
    ));

    expect(find.text('Music Player'), findsOneWidget);
    expect(find.text('Music'), findsOneWidget);
    expect(find.text('Options'), findsOneWidget);
  });

  testWidgets(
      'Test that tapping on the Playlist tile takes you to the Playlists page',
      (widgetTester) async {
    await widgetTester.pumpWidget(const MaterialApp(
      home: MainMenuDrawer(),
    ));

    await widgetTester.tap(find.byKey(Key('PlaylistTile')));
    await widgetTester.pumpAndSettle();

    expect(find.byType(PlaylistsPage), findsOneWidget);
  });

  testWidgets(
      'Test that tapping on the Artist tile takes you to the Artists page',
      (widgetTester) async {
    await widgetTester.pumpWidget(const MaterialApp(
      home: MainMenuDrawer(),
    ));

    await widgetTester.tap(find.byKey(Key('ArtistTile')));
    await widgetTester.pumpAndSettle();

    expect(find.byType(ArtistPage), findsOneWidget);
  });

  testWidgets(
      'Test that tapping on the Album tile takes you to the Albums page',
      (widgetTester) async {
    await widgetTester.pumpWidget(const MaterialApp(
      home: MainMenuDrawer(),
    ));

    await widgetTester.tap(find.byKey(Key('AlbumsTile')));
    await widgetTester.pumpAndSettle();

    expect(find.byType(AlbumsPage), findsOneWidget);
  });

  testWidgets('Test that tapping on the Song tile takes you to the Songs page',
      (widgetTester) async {
    await widgetTester.pumpWidget(const MaterialApp(
      home: MainMenuDrawer(),
    ));

    await widgetTester.tap(find.byKey(Key('SongsTile')));
    await widgetTester.pumpAndSettle();

    expect(find.byType(SongsPage), findsOneWidget);
  });
}
