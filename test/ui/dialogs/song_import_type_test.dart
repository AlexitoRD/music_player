/*
 * Author: Alexander Dunbar
 * Date: 2022-11-04, 9:12 p.m.
 */

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:music_player/ui/dialogs/song_import_type.dart';
import 'package:music_player/utils/locator.dart';

import '../../mocks/bloc_setup.dart';
import '../../mocks/mock_classes.dart';

void main() {
  late MockAddMusic mockAddMusic;

  setUp(() {
    mockAddMusic = BlocSetup.setUpAddMusic();
  });

  tearDown(() {
    locator.reset();
  });

  testWidgets('Test that tapping on By File calls the addFile bloc method',
      (widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(home: Scaffold(body: SongImportType())),
    );

    expect(find.byType(SongImportType), findsOneWidget);

    await widgetTester.tap(find.byKey(Key('ByFile')));

    verify(() => mockAddMusic.addFile()).called(1);
  });

  testWidgets('Test that tapping on By Folder calls the addFolder bloc method',
      (widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(home: Scaffold(body: SongImportType())),
    );

    expect(find.byType(SongImportType), findsOneWidget);

    await widgetTester.tap(find.byKey(Key('ByFolder')));

    verify(() => mockAddMusic.addFolder()).called(1);
  });
}
