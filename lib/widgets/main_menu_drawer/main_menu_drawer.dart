/*
 * Author: Alexander Dunbar
 * Date: 2022-10-21, 10:02 p.m.
 */

/*
 * Author: Alexander Dunbar
 * Date: 2022-10-18, 8:30 p.m.
 */

import 'package:flutter/material.dart';

class MainMenuDrawer extends StatefulWidget {
  const MainMenuDrawer();

  @override
  State<MainMenuDrawer> createState() => _MainMenuDrawerState();
}

class _MainMenuDrawerState extends State<MainMenuDrawer> {
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
          ),
          ListTile(
            title: Text('Artists'),
            subtitle: Text('Sort music by artist'),
          ),
          ListTile(
            title: Text('Albums'),
            subtitle: Text('Sort music by albums'),
          ),
          ListTile(
            title: Text('Songs'),
            subtitle: Text('All songs added'),
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
          )
        ],
      ),
    );
  }
}
