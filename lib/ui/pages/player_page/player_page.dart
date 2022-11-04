/*
 * Author: Alexander Dunbar
 * Date: 2022-10-22, 4:11 p.m.
 */

import 'package:flutter/material.dart';
import 'package:music_player/models/song.dart';
import 'package:music_player/ui/pages/player_page/player_page_bloc.dart';
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
                    IconButton(onPressed: () {}, icon: Icon(Icons.shuffle)),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.keyboard_double_arrow_left),
                    ),
                    StreamBuilder<bool>(
                        stream: _bloc.isPlaying,
                        initialData: false,
                        builder: (context, snapshot) {
                          final isPlaying = snapshot.data!;
                          return IconButton(
                            key: Key('PlayPauseButton'),
                            onPressed: () {
                              isPlaying
                                  ? GlobalEventBus.sendEvent(PauseEvent())
                                  : GlobalEventBus.sendEvent(ResumeEvent());
                            },
                            icon: isPlaying
                                ? Icon(Icons.pause)
                                : Icon(Icons.play_arrow),
                          );
                        }),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.keyboard_double_arrow_right),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.loop)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}
