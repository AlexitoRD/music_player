/*
 * Author: Alexander Dunbar
 * Date: 2022-10-22, 9:53 p.m.
 */

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';
import 'package:music_player/database_service/song_service.dart';
import 'package:music_player/models/song.dart';
import 'package:music_player/utils/events/events.dart';
import 'package:music_player/utils/events/global_event_bus.dart';
import 'package:music_player/utils/locator.dart';

// coverage:ignore-file
class AddMusic {
  final SongService _songService = locator<SongService>();

  void addFile() async {
    FilePickerResult? results = await FilePicker.platform.pickFiles(
        allowMultiple: true, type: FileType.custom, allowedExtensions: ['mp3']);
    if (results != null) {
      List<File> files = results.paths.map((path) => File(path ?? '')).toList();
      for (File file in files) {
        final metadata = await MetadataRetriever.fromFile(File(file.path));
        final song = Song(
          title: metadata.trackName,
          artist: metadata.trackArtistNames?.first,
          album: metadata.albumName,
          year: metadata.year,
          filePath: file.path,
        );
        _songService.addSong(song);
        GlobalEventBus.sendEvent(ReloadMusicListEvent());
      }
    }
  }

  void addFolder() async {
    // String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
  }
}
