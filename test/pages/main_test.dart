/*
 * Author: Alexander Dunbar
 * Date: 2022-10-18, 8:14 p.m.
 */

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_player/pages/base_page.dart';

void main() {
  setUp(() {});

  tearDown(() {});

  testWidgets('Test that the base page builds correctly', (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: BasePage(),
      ),
    );

    expect(find.byType(BasePage), findsOneWidget);
    expect(find.text('M P'), findsOneWidget);
    expect(find.byKey(const Key('MenuKey')), findsOneWidget);
  });
}
