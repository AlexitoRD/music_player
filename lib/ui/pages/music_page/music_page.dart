/*
 * Author: Alexander Dunbar
 * Date: 2022-10-22, 9:11 p.m.
 */

import 'package:flutter/material.dart';
import 'package:music_player/ui/pages/albums_page/albums_page.dart';
import 'package:music_player/ui/pages/artists_page/artists_page.dart';
import 'package:music_player/ui/pages/playlists_page/playlists_page.dart';
import 'package:music_player/ui/pages/songs_page/songs_page.dart';

class MusicPage extends StatefulWidget {
  const MusicPage();

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  int _subcategoryIndex = 0;
  final List<Widget> _subcategories = [
    SongsPage(),
    ArtistsPage(),
    AlbumsPage(),
    PlaylistsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  ListTile(
                    title: Text('Songs'),
                    onTap: () {
                      setState(() {
                        _subcategoryIndex = 0;
                      });
                    },
                  ),
                  ListTile(
                    title: Text('Artists'),
                    onTap: () {
                      setState(() {
                        _subcategoryIndex = 1;
                      });
                    },
                  ),
                  ListTile(
                    title: Text('Albums'),
                    onTap: () {
                      setState(() {
                        _subcategoryIndex = 2;
                      });
                    },
                  ),
                  ListTile(
                    title: Text('Playlists'),
                    onTap: () {
                      setState(() {
                        _subcategoryIndex = 3;
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: IndexedStack(
                index: _subcategoryIndex,
                children: _subcategories,
              ),
            )
          ],
        ),
      ),
    );
  }
}
