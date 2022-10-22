/*
 * Author: Alexander Dunbar
 * Date: 2022-10-18, 8:14 p.m.
 */

import 'package:flutter/material.dart';
import 'package:music_player/pages/base_page.dart';
import 'package:music_player/utils/locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUp();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'M P',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: BasePage(),
    );
  }
}
