/*
 * Author: Alexander Dunbar
 * Date: 2022-10-21, 10:04 p.m.
 */

import 'package:flutter/material.dart';
import 'package:music_player/models/song.dart';
import 'package:music_player/ui/pages/songs_page/songs_page_bloc.dart';
import 'package:music_player/ui/widgets/cells/song_cell.dart';
import 'package:music_player/utils/locator.dart';

class SongsPage extends StatefulWidget {
  const SongsPage();

  @override
  State<SongsPage> createState() => _SongsPageState();
}

class _SongsPageState extends State<SongsPage> {
  final SongsPageBloc _bloc = locator<SongsPageBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.init();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder<List<Song>>(
        stream: _bloc.allSongs,
        builder: (context, snapshot) {
          final songList = snapshot.data;
          if (songList == null || songList.isEmpty) {
            return CircularProgressIndicator();
          }
          return ListView.builder(
            itemCount: songList.length,
            itemBuilder: (context, index) {
              return SongCell(
                  song: songList[index],
                  removeSong: _bloc.removeSong,
                  playSong: _bloc.playSong);
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}
