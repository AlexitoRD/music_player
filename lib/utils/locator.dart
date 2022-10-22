/*
 * Author: Alexander Dunbar
 * Date: 2022-10-21, 11:53 p.m.
 */
import 'package:audioplayers/audioplayers.dart';
import 'package:get_it/get_it.dart';
import 'package:music_player/database_service/database_service.dart';
import 'package:music_player/database_service/song_service.dart';
import 'package:music_player/pages/artists_page/artist_page_bloc.dart';
import 'package:music_player/pages/base_page/base_page_bloc.dart';
import 'package:music_player/pages/player_page/player_page_bloc.dart';
import 'package:music_player/pages/songs_page/songs_page_bloc.dart';
import 'package:music_player/widgets/main_menu_drawer/main_menu_drawer_bloc.dart';

final locator = GetIt.instance;

void setUp() {
  locator.registerFactory<DatabaseService>(() => DatabaseService());
  locator.registerFactory<SongService>(() => SongService());
  locator.registerFactory<MainMenuDrawerBloc>(() => MainMenuDrawerBloc());
  locator.registerFactory<SongsPageBloc>(() => SongsPageBloc());
  locator.registerFactory<PlayerPageBloc>(() => PlayerPageBloc());
  locator.registerFactory<AudioPlayer>(() => AudioPlayer());
  locator.registerFactory<BasePageBloc>(() => BasePageBloc());
  locator.registerFactory<ArtistsPageBloc>(() => ArtistsPageBloc());
}
