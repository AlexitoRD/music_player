/*
 * Author: Alexander Dunbar
 * Date: 2022-10-22, 11:01 p.m.
 */

import 'package:flutter/material.dart';
import 'package:music_player/utils/add_music.dart';
import 'package:music_player/utils/locator.dart';

class SongImportType extends StatefulWidget {
  const SongImportType();

  @override
  State<SongImportType> createState() => _SongImportTypeState();
}

class _SongImportTypeState extends State<SongImportType> {
  final AddMusic _addMusic = locator<AddMusic>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      key: Key('SongImportTypeDialog'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              key: Key('ByFile'),
              title: Text('By File'),
              subtitle: Text('Select individual or multiple songs'),
              onTap: () {
                _addMusic.addFile();
              },
            ),
            ListTile(
              key: Key('ByFolder'),
              title: Text('By Folder'),
              subtitle: Text('Select entire folders of songs'),
              onTap: () {
                _addMusic.addFolder();
              },
            )
          ],
        ),
      ),
    );
  }
}
