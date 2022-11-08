/*
 * Author: Alexander Dunbar
 * Date: 2022-10-22, 5:23 p.m.
 */

import 'package:music_player/models/song.dart';

abstract class GlobalEvent {}

class PlayEvent extends GlobalEvent {
  final Song song;

  PlayEvent({required this.song});
}

class PauseEvent extends GlobalEvent {
  PauseEvent();
}

class StopEvent extends GlobalEvent {
  StopEvent();
}

class ResumeEvent extends GlobalEvent {
  ResumeEvent();
}

class ReloadMusicListEvent extends GlobalEvent {
  ReloadMusicListEvent();
}
