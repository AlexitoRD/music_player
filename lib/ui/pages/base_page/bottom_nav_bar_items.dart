/*
 * Author: Alexander Dunbar
 * Date: 2022-10-22, 4:48 p.m.
 */

import 'package:flutter/material.dart';
import 'package:music_player/ui/pages/music_page/music_page.dart';
import 'package:music_player/ui/pages/player_page/player_page.dart';

class BottomNavBarItems {
  static List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.music_note), label: 'Music'),
    BottomNavigationBarItem(icon: Icon(Icons.play_arrow), label: 'Now Playing'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];

  static List<Widget> pages = [
    MusicPage(),
    PlayerPage(),
  ];
}
