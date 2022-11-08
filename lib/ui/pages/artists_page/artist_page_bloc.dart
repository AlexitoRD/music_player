/*
 * Author: Alexander Dunbar
 * Date: 2022-10-22, 7:48 p.m.
 */

import 'dart:async';

import 'package:music_player/database_service/song_service.dart';
import 'package:music_player/models/artist.dart';
import 'package:music_player/models/song.dart';
import 'package:music_player/utils/events/events.dart';
import 'package:music_player/utils/events/global_event_bus.dart';
import 'package:music_player/utils/locator.dart';
import 'package:rxdart/rxdart.dart';

class ArtistsPageBloc {
  final SongService _songService = locator<SongService>();

  final BehaviorSubject<List<Artist>> _allArtistsSubject =
      BehaviorSubject<List<Artist>>();
  final BehaviorSubject<List<Song>> _songsForArtistSubject =
      BehaviorSubject<List<Song>>();

  ValueStream<List<Artist>> get allArtists => _allArtistsSubject;

  ValueStream<List<Song>> get songsForArtist => _songsForArtistSubject;

  late StreamSubscription<GlobalEvent> _subscription;

  Future<void> init() async {
    _subscription = GlobalEventBus.events.listen((event) {
      if (event is ReloadMusicListEvent) {
        _updateArtistList();
      }
    });
    final allArtists = await _songService.getAllArtists();
    _allArtistsSubject.add(allArtists);
  }

  Future<void> getSongsForArtist(String arist) async {
    final songsForArtist = await _songService.getSongsForArtist(arist);
    _songsForArtistSubject.add(songsForArtist);
  }

  void playSong(Song song) {
    GlobalEventBus.sendEvent(PlayEvent(song: song));
  }

  Future<void> removeSong(int? songID) async {
    if (songID != null) {
      await _songService.removeSong(songID);
      //TODO: Need to update song list
    }
  }

  Future<void> _updateArtistList() async {
    final newArtistsList = await _songService.getAllArtists();
    _allArtistsSubject.add(newArtistsList);
  }

  void dispose() {
    _allArtistsSubject.close();
    _subscription.cancel();
  }
}
