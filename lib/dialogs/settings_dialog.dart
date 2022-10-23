/*
 * Author: Alexander Dunbar
 * Date: 2022-10-22, 9:32 p.m.
 */

import 'package:flutter/material.dart';
import 'package:music_player/utils/events/events.dart';
import 'package:music_player/utils/events/global_event_bus.dart';

class SettingsDialog extends StatefulWidget {
  const SettingsDialog();

  @override
  State<SettingsDialog> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text('Add Music'),
              subtitle: Text('Add music from your device to the app'),
              onTap: () {
                GlobalEventBus.sendEvent(AddMusicEvent());
              },
            ),
            ListTile(
              title: Text('Audio Settings'),
              subtitle: Text('Settings that effect the audio'),
            ),
            ListTile(
              title: Text('App Settings'),
              subtitle: Text('Settings that effect the app itself'),
            )
          ],
        ),
      ),
    );
  }
}
