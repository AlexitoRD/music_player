/*
 * Author: Alexander Dunbar
 * Date: 2022-10-21, 10:04 p.m.
 */

import 'package:flutter/material.dart';
import 'package:music_player/models/song.dart';
import 'package:music_player/pages/songs_page/songs_page_bloc.dart';
import 'package:music_player/utils/locator.dart';
import 'package:music_player/widgets/main_menu_drawer/main_menu_drawer.dart';

class SongsPage extends StatefulWidget {
  const SongsPage();

  @override
  State<SongsPage> createState() => _SongsPageState();
}

class _SongsPageState extends State<SongsPage> {
  final SongsPageBloc _songsPageBloc = locator<SongsPageBloc>();

  @override
  void initState() {
    super.initState();
    _songsPageBloc.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: MainMenuDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Songs'),
      ),
      body: SafeArea(
        child: Center(
          child: StreamBuilder<List<Song>>(
              stream: _songsPageBloc.allSongs,
              builder: (context, snapshot) {
                final songList = snapshot.data;
                if (songList == null || songList.isEmpty) {
                  return CircularProgressIndicator();
                }
                return ListView.builder(
                  itemCount: songList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(songList[index].title ?? 'Unknown Title'),
                      subtitle:
                          Text(songList[index].artist ?? 'Unknown Artist'),
                      onLongPress: () async {
                        await _songsPageBloc.removeSong(songList[index].id);
                      },
                      onTap: () async {
                        await _songsPageBloc.playSong(songList[index].filePath);
                      },
                    );
                  },
                );
              }),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _songsPageBloc.dispose();
  }
}
