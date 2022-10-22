/*
 * Author: Alexander Dunbar
 * Date: 2022-10-22, 4:48 p.m.
 */

import 'package:flutter/material.dart';
import 'package:music_player/pages/albums_page/albums_page.dart';
import 'package:music_player/pages/artists_page/artists_page.dart';
import 'package:music_player/pages/player_page/player_page.dart';
import 'package:music_player/pages/playlists_page/playlists_page.dart';
import 'package:music_player/pages/songs_page/songs_page.dart';

class BottomNavBarItems {
  static List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.album), label: 'Albums'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Artists'),
    BottomNavigationBarItem(icon: Icon(Icons.play_arrow), label: 'Playing'),
    BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Playlists'),
    BottomNavigationBarItem(icon: Icon(Icons.music_note), label: 'Songs'),
  ];

  static List<Widget> pages = [
    AlbumsPage(),
    ArtistsPage(),
    PlayerPage(),
    PlaylistsPage(),
    SongsPage(),
  ];
}
