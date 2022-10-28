/*
 * Author: Alexander Dunbar
 * Date: 2022-10-27, 9:03 p.m.
 */

import 'package:music_player/ui/pages/artists_page/artist_page_bloc.dart';
import 'package:music_player/ui/pages/base_page/base_page_bloc.dart';
import 'package:music_player/ui/pages/player_page/player_page_bloc.dart';
import 'package:music_player/ui/pages/songs_page/songs_page_bloc.dart';
import 'package:music_player/utils/locator.dart';

import 'mock_classes.dart';

class BlocSetup {
  static MockPlayerPageBloc setUpMockPlayPageBloc() {
    final mock = MockPlayerPageBloc();
    locator.registerSingleton<PlayerPageBloc>(mock);
    return mock;
  }

  static MockBasePageBloc setUpBasePageBloc() {
    final mock = MockBasePageBloc();
    locator.registerSingleton<BasePageBloc>(mock);
    return mock;
  }

  static MockSongsPageBloc setUpSongPageBloc() {
    final mock = MockSongsPageBloc();
    locator.registerSingleton<SongsPageBloc>(mock);
    return mock;
  }

  static MockArtistsPageBloc setUpArtistBloc() {
    final mock = MockArtistsPageBloc();
    locator.registerSingleton<ArtistsPageBloc>(mock);
    return mock;
  }
}
