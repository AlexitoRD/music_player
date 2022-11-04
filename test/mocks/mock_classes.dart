/*
 * Author: Alexander Dunbar
 * Date: 2022-10-27, 9:01 p.m.
 */

import 'package:audioplayers/audioplayers.dart';
import 'package:mocktail/mocktail.dart';
import 'package:music_player/database_service/song_service.dart';
import 'package:music_player/models/song.dart';
import 'package:music_player/ui/pages/artists_page/artist_page_bloc.dart';
import 'package:music_player/ui/pages/base_page/base_page_bloc.dart';
import 'package:music_player/ui/pages/player_page/player_page_bloc.dart';
import 'package:music_player/ui/pages/songs_page/songs_page_bloc.dart';
import 'package:rxdart/rxdart.dart';

class MockPlayerPageBloc extends Mock implements PlayerPageBloc {
  MockPlayerPageBloc() {
    when(() => init()).thenAnswer((_) async {});
    when(() => currentSong)
        .thenAnswer((_) => BehaviorSubject.seeded(Song(filePath: '')));
    when(() => isPlaying).thenAnswer((_) => BehaviorSubject.seeded(false));
  }
}

class MockBasePageBloc extends Mock implements BasePageBloc {
  MockBasePageBloc() {
    when(() => init()).thenAnswer((_) async {});
  }
}

class MockSongsPageBloc extends Mock implements SongsPageBloc {
  MockSongsPageBloc() {
    when(() => init()).thenAnswer((_) async {});
    when(() => allSongs).thenAnswer((_) => BehaviorSubject.seeded([]));
  }
}

class MockArtistsPageBloc extends Mock implements ArtistsPageBloc {
  MockArtistsPageBloc() {
    when(() => init()).thenAnswer((_) async {});
    when(() => allArtists).thenAnswer((_) => BehaviorSubject.seeded([]));
  }
}

class MockSongService extends Mock implements SongService {
  MockSongService() {
    when(() => getAllSongs()).thenAnswer((_) => Future.value([]));
  }
}

class MockAudioPlayer extends Mock implements AudioPlayer {
  MockAudioPlayer() {
    when(() => play(any())).thenAnswer((_) async {});
    when(() => pause()).thenAnswer((_) async {});
    when(() => resume()).thenAnswer((_) async {});
    when(() => release()).thenAnswer((_) async {});
  }
}
