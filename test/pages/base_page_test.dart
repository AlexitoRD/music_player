/*
 * Author: Alexander Dunbar
 * Date: 2022-10-18, 8:14 p.m.
 */

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_player/ui/pages/base_page/base_page.dart';

import '../mocks/bloc_setup.dart';
import '../mocks/mock_classes.dart';

void main() {
  late MockPlayerPageBloc mockPlayerPageBloc;
  late MockBasePageBloc mockBasePageBloc;
  late MockSongsPageBloc mockSongsPageBloc;
  late MockArtistsPageBloc mockArtistsPageBloc;

  setUp(() {
    mockPlayerPageBloc = BlocSetup.setUpMockPlayPageBloc();
    mockBasePageBloc = BlocSetup.setUpBasePageBloc();
    mockSongsPageBloc = BlocSetup.setUpSongPageBloc();
    mockArtistsPageBloc = BlocSetup.setUpArtistBloc();
  });

  tearDown(() {});

  testWidgets('Test that the base page builds correctly', (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: BasePage(),
      ),
    );

    expect(find.byType(BasePage), findsOneWidget);
    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });
}
