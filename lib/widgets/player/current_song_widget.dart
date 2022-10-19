/*
 * Author: Alexander Dunbar
 * Date: 2022-10-19, 12:25 a.m.
 */

import 'package:flutter/material.dart';

class CurrentSongWidget extends StatefulWidget {
  const CurrentSongWidget();

  @override
  State<CurrentSongWidget> createState() => _CurrentSongWidgetState();
}

class _CurrentSongWidgetState extends State<CurrentSongWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text('Name of Current Song'),
        SizedBox(
          height: 7,
        ),
        Text('Name of Current Artist'),
      ],
    );
  }
}
