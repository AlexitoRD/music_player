/*
 * Author: Alexander Dunbar
 * Date: 2022-11-04, 9:46 p.m.
 */

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:music_player/models/artist.dart';
import 'package:music_player/ui/pages/artists_page/artists_page.dart';
import 'package:music_player/utils/locator.dart';
import 'package:rxdart/rxdart.dart';

import '../../../mocks/bloc_setup.dart';
import '../../../mocks/mock_classes.dart';

void main() {
  late MockArtistsPageBloc mockArtistsPageBloc;

  setUp(() {
    mockArtistsPageBloc = BlocSetup.setUpMockArtistBloc();
  });

  tearDown(() {
    locator.reset();
  });

  testWidgets('Test the arist page builds correctly', (widgetTester) async {
    when(() => mockArtistsPageBloc.allArtists).thenAnswer(
        (invocation) => BehaviorSubject.seeded([Artist(name: 'Twice')]));
    await widgetTester.pumpWidget(MaterialApp(
      home: Scaffold(body: ArtistsPage()),
    ));
    await widgetTester.pump();

    expect(find.byType(ArtistsPage), findsOneWidget);
    expect(find.byKey(Key('ArtistTile')), findsOneWidget);
    expect(find.text('Twice'), findsOneWidget);
  });
}
