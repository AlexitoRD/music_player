/*
 * Author: Alexander Dunbar
 * Date: 2022-10-22, 9:32 p.m.
 */

import 'package:flutter/material.dart';
import 'package:music_player/ui/dialogs/song_import_type.dart';

class SettingsBottomSheet extends StatefulWidget {
  const SettingsBottomSheet();

  @override
  State<SettingsBottomSheet> createState() => _SettingsBottomSheetState();
}

class _SettingsBottomSheetState extends State<SettingsBottomSheet> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text('Add Music'),
              subtitle: Text('Add music from your device to the app'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return SongImportType();
                  },
                );
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
