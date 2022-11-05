/*
 * Author: Alexander Dunbar
 * Date: 2022-11-04, 8:57 p.m.
 */

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_player/ui/sheets/settings_sheet.dart';
import 'package:music_player/utils/locator.dart';

import '../../mocks/bloc_setup.dart';

void main() {
  setUp(() {
    BlocSetup.setUpAddMusic();
  });

  tearDown(() {
    locator.reset();
  });

  testWidgets(
      'Test that tapping on Add Music opens the Song Import Type Dialog',
      (widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SettingsBottomSheet(),
        ),
      ),
    );

    await widgetTester.tap(find.byKey(Key('AddMusicTile')));
    await widgetTester.pumpAndSettle();

    expect(find.byKey(Key('SongImportTypeDialog')), findsOneWidget);
  });
}
