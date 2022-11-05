/*
 * Author: Alexander Dunbar
 * Date: 2022-11-04, 9:27 p.m.
 */

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_player/ui/pages/albums_page/albums_page.dart';
import 'package:music_player/ui/pages/artists_page/artists_page.dart';
import 'package:music_player/ui/pages/music_page/music_page.dart';
import 'package:music_player/ui/pages/playlists_page/playlists_page.dart';
import 'package:music_player/ui/pages/songs_page/songs_page.dart';

import '../../../mocks/bloc_setup.dart';

void main() {
  setUp(() {
    BlocSetup.setUpMockSongPageBloc();
    BlocSetup.setUpMockArtistBloc();
  });

  testWidgets(
      'Test that tapping the different tiles switches to the different subcategories',
      (widgetTester) async {
    await widgetTester.pumpWidget(MaterialApp(
      home: MusicPage(),
    ));

    expect(find.byType(MusicPage), findsOneWidget);

    await widgetTester.tap(find.byType(ListTile).at(0));
    await widgetTester.pump();

    expect(find.byType(SongsPage), findsOneWidget);

    await widgetTester.tap(find.byType(ListTile).at(1));
    await widgetTester.pump();

    expect(find.byType(ArtistsPage), findsOneWidget);

    await widgetTester.tap(find.byType(ListTile).at(2));
    await widgetTester.pump();

    expect(find.byType(AlbumsPage), findsOneWidget);

    await widgetTester.tap(find.byType(ListTile).at(3));
    await widgetTester.pump();

    expect(find.byType(PlaylistsPage), findsOneWidget);
  });
}
