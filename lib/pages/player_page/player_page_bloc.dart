/*
 * Author: Alexander Dunbar
 * Date: 2022-10-22, 3:45 p.m.
 */

import 'package:audioplayers/audioplayers.dart';

class PlayerPageBloc {
  final AudioPlayer audioPlayer = AudioPlayer();

  Future<void> init() async {}

  Future<void> playSong() async {}

  Future<void> pauseSong() async {}
}
