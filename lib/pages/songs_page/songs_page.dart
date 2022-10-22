/*
 * Author: Alexander Dunbar
 * Date: 2022-10-21, 10:04 p.m.
 */

import 'package:flutter/material.dart';
import 'package:music_player/models/song.dart';
import 'package:music_player/pages/songs_page/songs_page_bloc.dart';
import 'package:music_player/utils/locator.dart';

class SongsPage extends StatefulWidget {
  const SongsPage();

  @override
  State<SongsPage> createState() => _SongsPageState();
}

class _SongsPageState extends State<SongsPage> {
  final SongsPageBloc _bloc = locator<SongsPageBloc>();
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _bloc.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Center(
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
                    return ListTile(
                      title: Text(songList[index].title ?? 'Unknown Title'),
                      subtitle:
                          Text(songList[index].artist ?? 'Unknown Artist'),
                      onLongPress: () async {
                        await _bloc.removeSong(songList[index].id);
                      },
                      onTap: () {
                        _isPlaying
                            ? _bloc.pauseSong()
                            : _bloc.playSong(songList[index].filePath);
                        setState(() {
                          _isPlaying = !_isPlaying;
                        });
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
    _bloc.dispose();
  }
}
