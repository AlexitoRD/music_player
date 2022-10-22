/*
 * Author: Alexander Dunbar
 * Date: 2022-10-22, 4:11 p.m.
 */

/*
 * Author: Alexander Dunbar
 * Date: 2022-10-18, 8:14 p.m.
 */

import 'package:flutter/material.dart';
import 'package:music_player/utils/device_info.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage();

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  late DeviceInfo _deviceInfo;

  @override
  void initState() {
    super.initState();
    _deviceInfo = DeviceInfo(context);
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
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: const [
                    Text('Name of Current Song'),
                    SizedBox(
                      height: 7,
                    ),
                    Text('Name of Current Artist'),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.keyboard_double_arrow_left),
                  ),
                  IconButton(
                    onPressed: () {},
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
        ],
      ),
    );
  }
}
