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
  final DraggableScrollableController _draggableController =
      DraggableScrollableController();
  final double _minDraggableSize = 0.25;

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
            controller: _draggableController,
            snap: true,
            initialChildSize: 0.25,
            minChildSize: _minDraggableSize,
            maxChildSize: 0.6,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                color: Colors.black26.withOpacity(0.9),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: const [
                          CurrentSongWidget(),
                          ControlsWidget(),
                        ],
                      ),
                    ),
                    Divider(),
                    Expanded(
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: 25,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text('Item $index'),
                            onTap: _hidePlaylist,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }),
      ],
    );
  }

  void _hidePlaylist() {
    _draggableController.animateTo(_minDraggableSize,
        duration: Duration(milliseconds: 100), curve: Curves.easeOutBack);
  }
}
