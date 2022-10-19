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
                child: Text(
                  'Music Player',
                  style: TextStyle(fontSize: 28),
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
          ),
          ListTile(
            title: Text('Artists'),
          ),
          ListTile(
            title: Text('Albums'),
          ),
          ListTile(
            title: Text('Songs'),
          ),
          ListTile(
            title: Text(
              'Options',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Divider(),
          ListTile(
            title: Text('File Locations'),
          )
        ],
      ),
    );
  }
}
