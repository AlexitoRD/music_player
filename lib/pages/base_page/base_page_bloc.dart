/*
 * Author: Alexander Dunbar
 * Date: 2022-10-22, 5:07 p.m.
 */

import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';
import 'package:music_player/database_service/song_service.dart';
import 'package:music_player/utils/events/events.dart';
import 'package:music_player/utils/events/global_event_bus.dart';
import 'package:music_player/utils/locator.dart';

import '../../models/song.dart';

class BasePageBloc {
  final AudioPlayer _audioPlayer = locator<AudioPlayer>();
  final SongService _songService = locator<SongService>();

  late StreamSubscription<GlobalEvent> _globalEvents;

  Future<void> init() async {
    _globalEvents = GlobalEventBus.events.listen((event) async {
      if (event is PlayEvent) {
        _audioPlayer.play(DeviceFileSource(event.song.filePath));
      }
      if (event is PauseEvent) {
        _audioPlayer.pause();
      }
      if (event is ResumeEvent) {
        _audioPlayer.resume();
      }
      if (event is AddMusicEvent) {
        FilePickerResult? results = await FilePicker.platform.pickFiles(
            allowMultiple: true,
            type: FileType.custom,
            allowedExtensions: ['mp3']);
        if (results != null) {
          List<File> files =
              results.paths.map((path) => File(path ?? '')).toList();
          for (File file in files) {
            final metadata = await MetadataRetriever.fromFile(File(file.path));
            final song = Song(
                title: metadata.trackName,
                artist: metadata.trackArtistNames?.first,
                album: metadata.albumName,
                year: metadata.year,
                filePath: file.path);
            _songService.addSong(song);
          }
        }
      }
    });
  }

  void dispose() {
    _globalEvents.cancel();
    _audioPlayer.release();
  }
}
