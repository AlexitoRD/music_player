/*
 * Author: Alexander Dunbar
 * Date: 2022-10-22, 12:00 a.m.
 */

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';
import 'package:music_player/database_service/song_service.dart';
import 'package:music_player/models/song.dart';
import 'package:music_player/utils/locator.dart';

class MainMenuDrawerBloc {
  final SongService _songService = locator<SongService>();

  Future<void> init() async {}

  Future<void> selectSongs() async {
    FilePickerResult? results = await FilePicker.platform.pickFiles(
        allowMultiple: true, type: FileType.custom, allowedExtensions: ['mp3']);
    if (results != null) {
      List<File> files = results.paths.map((path) => File(path ?? '')).toList();
      for (File file in files) {
        final metadata = await MetadataRetriever.fromFile(File(file.path));
        final Song song = Song(
            title: metadata.trackName,
            artist: metadata.trackArtistNames?.first,
            filePath: file.path);
        _songService.addSong(song);
      }
    }
  }
}
