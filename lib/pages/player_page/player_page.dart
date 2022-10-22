/*
 * Author: Alexander Dunbar
 * Date: 2022-10-22, 4:11 p.m.
 */

import 'package:flutter/material.dart';
import 'package:music_player/models/song.dart';
import 'package:music_player/pages/player_page/player_page_bloc.dart';
import 'package:music_player/utils/device_info.dart';
import 'package:music_player/utils/events/events.dart';
import 'package:music_player/utils/events/global_event_bus.dart';
import 'package:music_player/utils/locator.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage();

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  late DeviceInfo _deviceInfo;
  final PlayerPageBloc _bloc = locator<PlayerPageBloc>();

  @override
  void initState() {
    super.initState();
    print('Player init');
    _deviceInfo = DeviceInfo(context);
    _bloc.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            child: Center(
              child: SizedBox(
                child: Icon(
                  Icons.image,
                  size: _deviceInfo.deviceHeight * 0.3,
                ),
              ),
            ),
          ),
          Container(
            color: Colors.grey,
            child: Column(
              children: [
                StreamBuilder<Song>(
                    stream: _bloc.currentSong,
                    builder: (context, snapshot) {
                      final currentSong = snapshot.data;
                      print('Current Song ${currentSong?.title}');
                      print('Current Song ${currentSong?.artist}');
                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(currentSong?.title ?? ''),
                            SizedBox(
                              height: 7,
                            ),
                            Text(currentSong?.artist ?? ''),
                          ],
                        ),
                      );
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.keyboard_double_arrow_left),
                    ),
                    IconButton(
                      onPressed: () {
                        GlobalEventBus.sendEvent(PauseEvent());
                      },
                      icon: Icon(Icons.pause),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.keyboard_double_arrow_right),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
