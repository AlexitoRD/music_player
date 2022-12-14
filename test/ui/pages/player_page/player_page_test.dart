/*
 * Author: Alexander Dunbar
 * Date: 2022-11-04, 12:06 a.m.
 */

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:music_player/ui/pages/player_page/player_page.dart';
import 'package:music_player/utils/locator.dart';
import 'package:rxdart/rxdart.dart';

import '../../../mocks/bloc_setup.dart';
import '../../../mocks/mock_classes.dart';

void main() {
  late MockPlayerPageBloc mockPlayerPageBloc;

  setUp(() {
    mockPlayerPageBloc = BlocSetup.setUpMockPlayPageBloc();
  });

  tearDown(() {
    locator.reset();
  });

  testWidgets('Test the music gets paused', (tester) async {
    when(() => mockPlayerPageBloc.isPlaying)
        .thenAnswer((_) => BehaviorSubject.seeded(true));
    await tester.pumpWidget(
      MaterialApp(
        home: PlayerPage(),
      ),
    );

    await tester.pump();

    expect(find.byType(PlayerPage), findsOneWidget);
    expect(find.byIcon(Icons.pause), findsOneWidget);

    await tester.tap(find.byKey(Key('PlayPauseButton')));
  });

  testWidgets('Test the music gets played', (tester) async {
    when(() => mockPlayerPageBloc.isPlaying)
        .thenAnswer((_) => BehaviorSubject.seeded(false));
    await tester.pumpWidget(
      MaterialApp(
        home: PlayerPage(),
      ),
    );

    await tester.pump();

    expect(find.byType(PlayerPage), findsOneWidget);
    expect(find.byIcon(Icons.play_arrow), findsOneWidget);

    await tester.tap(find.byKey(Key('PlayPauseButton')));
  });
}
