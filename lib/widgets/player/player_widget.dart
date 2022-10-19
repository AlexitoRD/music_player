/*
 * Author: Alexander Dunbar
 * Date: 2022-10-18, 11:05 p.m.
 */

/*
 * Author: Alexander Dunbar
 * Date: 2022-10-18, 10:48 p.m.
 */

import 'package:flutter/material.dart';
import 'package:music_player/utils/device_info.dart';
import 'package:music_player/widgets/player/album_art_widget.dart';
import 'package:music_player/widgets/player/controls_widget.dart';
import 'package:music_player/widgets/player/current_song_widget.dart';

class PlayerWidget extends StatefulWidget {
  const PlayerWidget();

  @override
  State<PlayerWidget> createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  late DeviceInfo _deviceInfo;

  @override
  void initState() {
    super.initState();
    _deviceInfo = DeviceInfo(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: _deviceInfo.deviceHeight * 0.75,
          child: AlbumArtWidget(),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: CurrentSongWidget(),
        ),
        ControlsWidget(),
      ],
    );
  }
}
