/*
 * Author: Alexander Dunbar
 * Date: 2022-10-21, 10:02 p.m.
 */

/*
 * Author: Alexander Dunbar
 * Date: 2022-10-18, 8:30 p.m.
 */

import 'package:flutter/material.dart';
import 'package:music_player/pages/albums_page/albums_page.dart';
import 'package:music_player/pages/artists_page/artists_page.dart';
import 'package:music_player/pages/playlists_page/playlists_page.dart';
import 'package:music_player/pages/songs_page/songs_page.dart';
import 'package:music_player/utils/locator.dart';
import 'package:music_player/widgets/main_menu_drawer/main_menu_drawer_bloc.dart';

class MainMenuDrawer extends StatefulWidget {
  const MainMenuDrawer();

  @override
  State<MainMenuDrawer> createState() => _MainMenuDrawerState();
}

class _MainMenuDrawerState extends State<MainMenuDrawer> {
  final _bloc = locator<MainMenuDrawerBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.init();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: Key('MenuKey'),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 100,
            child: DrawerHeader(
              child: Container(
                alignment: Alignment.bottomLeft,
                child: ListTile(
                  title: Text(
                    'Music Player',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Music',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Playlists'),
            subtitle: Text('View your created playlists'),
            key: Key('PlaylistTile'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const PlaylistsPage(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Artists'),
            subtitle: Text('Sort music by artist'),
            key: Key('ArtistTile'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ArtistsPage(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Albums'),
            subtitle: Text('Sort music by albums'),
            key: Key('AlbumsTile'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AlbumsPage(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Songs'),
            subtitle: Text('All songs added'),
            key: Key('SongsTile'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SongsPage(),
                ),
              );
            },
          ),
          ListTile(
            title: Text(
              'Options',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Add Music'),
            subtitle: Text('Add music from your device to the player'),
            onTap: () async {
              _bloc.selectSongs();
            },
          )
        ],
      ),
    );
  }
}
