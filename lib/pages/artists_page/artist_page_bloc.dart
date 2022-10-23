/*
 * Author: Alexander Dunbar
 * Date: 2022-10-22, 7:48 p.m.
 */

import 'dart:async';

import 'package:music_player/database_service/song_service.dart';
import 'package:music_player/models/artist.dart';
import 'package:music_player/utils/events/events.dart';
import 'package:music_player/utils/events/global_event_bus.dart';
import 'package:music_player/utils/locator.dart';
import 'package:rxdart/rxdart.dart';

class ArtistsPageBloc {
  final SongService _songService = locator<SongService>();

  final BehaviorSubject<List<Artist>> _allArtistsSubject =
      BehaviorSubject<List<Artist>>();

  ValueStream<List<Artist>> get allArtists => _allArtistsSubject;

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

  Future<void> _updateArtistList() async {
    final newArtistsList = await _songService.getAllArtists();
    _allArtistsSubject.add(newArtistsList);
  }

  void dispose() {
    _allArtistsSubject.close();
    _subscription.cancel();
  }
}
