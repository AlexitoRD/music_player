/*
 * Author: Alexander Dunbar
 * Date: 2022-11-04, 8:27 p.m.
 */

/*
 * Author: Alexander Dunbar
 * Date: 2022-10-18, 8:14 p.m.
 */

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_player/ui/pages/base_page/base_page.dart';
import 'package:music_player/utils/locator.dart';

import '../../../mocks/bloc_setup.dart';

void main() {
  setUp(() {
    BlocSetup.setUpMockPlayPageBloc();
    BlocSetup.setUpMockBasePageBloc();
    BlocSetup.setUpMockSongPageBloc();
    BlocSetup.setUpMockArtistBloc();
  });

  tearDown(() {
    locator.reset();
  });

  testWidgets('Test that the base page builds correctly', (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: BasePage(),
      ),
    );

    expect(find.byType(BasePage), findsOneWidget);
    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });

  testWidgets('Test that tapping on the settings item opens the sheet',
      (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: BasePage(),
      ),
    );

    await widgetTester.tap(find.byIcon(Icons.settings));
    await widgetTester.pump();

    expect(find.byKey(Key('SettingsBottomSheet')), findsOneWidget);
  });

  testWidgets('Test that tapping the note opens the music page',
      (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: BasePage(),
      ),
    );

    await widgetTester.tap(find.byIcon(Icons.music_note));
    await widgetTester.pump();

    expect(find.byKey(Key('MusicPage')), findsOneWidget);
  });

  testWidgets('Tes that tapping the play button opens the player',
      (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: BasePage(),
      ),
    );

    await widgetTester.tap(find.byIcon(Icons.music_note));
    await widgetTester.pump();

    expect(find.byKey(Key('PlayerPage')), findsOneWidget);
  });
}
