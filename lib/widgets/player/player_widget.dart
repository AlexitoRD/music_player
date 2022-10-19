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
    return Stack(
      children: [
        SizedBox(
          height: _deviceInfo.deviceHeight * 0.72,
          child: AlbumArtWidget(),
        ),
        DraggableScrollableSheet(
            snap: true,
            initialChildSize: 0.1,
            minChildSize: 0.1,
            maxChildSize: 0.6,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                color: Colors.black12.withOpacity(0.9),
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: 25,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: const [
                            CurrentSongWidget(),
                            ControlsWidget(),
                          ],
                        ),
                      );
                    }
                    return ListTile(title: Text('Item $index'));
                  },
                ),
              );
            }),
      ],
    );
  }
}
