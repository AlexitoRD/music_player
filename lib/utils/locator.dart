/*
 * Author: Alexander Dunbar
 * Date: 2022-10-21, 11:53 p.m.
 */
import 'package:audioplayers/audioplayers.dart';
import 'package:get_it/get_it.dart';
import 'package:music_player/database_service/database_service.dart';
import 'package:music_player/database_service/song_service.dart';
import 'package:music_player/ui/pages/artists_page/artist_page_bloc.dart';
import 'package:music_player/ui/pages/player_page/player_page_bloc.dart';
import 'package:music_player/ui/pages/songs_page/songs_page_bloc.dart';
import 'package:music_player/utils/add_music.dart';

import '../ui/pages/base_page/base_page_bloc.dart';

final locator = GetIt.instance;

void setUp() {
  locator.registerFactory<DatabaseService>(() => DatabaseService());
  locator.registerFactory<SongService>(() => SongService());
  locator.registerFactory<SongsPageBloc>(() => SongsPageBloc());
  locator.registerFactory<PlayerPageBloc>(() => PlayerPageBloc());
  locator.registerFactory<AudioPlayer>(() => AudioPlayer());
  locator.registerFactory<BasePageBloc>(() => BasePageBloc());
  locator.registerFactory<ArtistsPageBloc>(() => ArtistsPageBloc());
  locator.registerFactory<AddMusic>(() => AddMusic());
}
