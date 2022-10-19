/*
 * Author: Alexander Dunbar
 * Date: 2022-10-18, 10:59 p.m.
 */

import 'package:flutter/material.dart';
import 'package:music_player/utils/device_info.dart';

class AlbumArtWidget extends StatefulWidget {
  const AlbumArtWidget();

  @override
  State<AlbumArtWidget> createState() => _AlbumArtWidgetState();
}

class _AlbumArtWidgetState extends State<AlbumArtWidget> {
  late DeviceInfo _deviceInfo;

  @override
  void initState() {
    super.initState();
    _deviceInfo = DeviceInfo(context);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: Icon(
          Icons.image,
          size: _deviceInfo.deviceHeight * 0.3,
        ),
      ),
    );
  }
}
