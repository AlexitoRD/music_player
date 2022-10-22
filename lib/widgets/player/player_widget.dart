/*
 * Author: Alexander Dunbar
 * Date: 2022-10-18, 11:05 p.m.
 */

/*
 * Author: Alexander Dunbar
 * Date: 2022-10-18, 10:48 p.m.
 */

import 'package:flutter/material.dart';
import 'package:music_player/widgets/player/album_art_widget.dart';
import 'package:music_player/widgets/player/controls_widget.dart';
import 'package:music_player/widgets/player/current_song_widget.dart';

class PlayerWidget extends StatefulWidget {
  const PlayerWidget();

  @override
  State<PlayerWidget> createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          child: AlbumArtWidget(),
        ),
        Container(
          child: Column(
            children: const [
              CurrentSongWidget(),
              ControlsWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
