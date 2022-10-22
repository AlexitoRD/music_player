/*
 * Author: Alexander Dunbar
 * Date: 2022-10-22, 12:00 a.m.
 */

import 'dart:io';

import 'package:file_picker/file_picker.dart';

class MainMenuDrawerBloc {
  Future<void> init() async {}

  Future<void> selectSongs() async {
    FilePickerResult? results = await FilePicker.platform.pickFiles(
        allowMultiple: true, type: FileType.custom, allowedExtensions: ['mp3']);
    if (results != null) {
      List<File> files = results.paths.map((path) => File(path ?? '')).toList();
    }
  }
}
