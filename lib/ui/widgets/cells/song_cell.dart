/*
 * Author: Alexander Dunbar
 * Date: 2022-11-07, 11:26 p.m.
 */

import 'package:flutter/material.dart';
import 'package:music_player/models/song.dart';

class SongCell extends StatelessWidget {
  final Song song;
  final Function(int?) removeSong;
  final Function(Song) playSong;

  const SongCell(
      {required this.song, required this.removeSong, required this.playSong});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(song.title ?? 'Unknown Title'),
      subtitle: Text(song.artist ?? 'Unknown Artist'),
      onLongPress: () async {
        removeSong(song.id);
      },
      onTap: () {
        playSong(song);
      },
    );
  }
}
