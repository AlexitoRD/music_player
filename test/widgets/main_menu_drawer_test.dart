/*
 * Author: Alexander Dunbar
 * Date: 2022-10-18, 8:36 p.m.
 */

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
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
}
