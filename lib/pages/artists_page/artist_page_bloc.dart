/*
 * Author: Alexander Dunbar
 * Date: 2022-10-22, 7:48 p.m.
 */

import 'package:music_player/database_service/song_service.dart';
import 'package:music_player/models/artist.dart';
import 'package:music_player/utils/locator.dart';
import 'package:rxdart/rxdart.dart';

class ArtistsPageBloc {
  final SongService _songService = locator<SongService>();

  final BehaviorSubject<List<Artist>> _allArtistsSubject =
      BehaviorSubject<List<Artist>>();

  ValueStream<List<Artist>> get allArtists => _allArtistsSubject;

  Future<void> init() async {
    final allArtists = await _songService.getAllArtists();
    _allArtistsSubject.add(allArtists);
  }

  void dispose() {
    _allArtistsSubject.close();
  }
}
