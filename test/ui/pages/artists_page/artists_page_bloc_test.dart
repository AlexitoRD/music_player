/*
 * Author: Alexander Dunbar
 * Date: 2022-11-04, 9:46 p.m.
 */

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:music_player/models/artist.dart';
import 'package:music_player/ui/pages/artists_page/artist_page_bloc.dart';
import 'package:music_player/utils/events/events.dart';
import 'package:music_player/utils/events/global_event_bus.dart';
import 'package:music_player/utils/locator.dart';

import '../../../mocks/bloc_setup.dart';
import '../../../mocks/mock_classes.dart';
import '../../../test_utils/test_utils.dart';

void main() {
  late MockSongService mockSongService;
  setUp(() {
    mockSongService = BlocSetup.setUpMockSongService();
  });

  tearDown(() {
    locator.reset();
  });

  test('init listens for events and calls getAllArtists()', () async {
    final artist = Artist(name: 'Phil Collins');
    when(() => mockSongService.getAllArtists())
        .thenAnswer((invocation) => Future.value([artist]));
    GlobalEventBus.events.listen((event) {
      expect(event.runtimeType, ReloadMusicListEvent);
    });

    ArtistsPageBloc bloc = ArtistsPageBloc();
    await bloc.init();
    await Future.delayed(Duration.zero);

    GlobalEventBus.sendEvent(ReloadMusicListEvent());
    await Future.delayed(Duration.zero);

    verify(() => mockSongService.getAllArtists()).called(2);
    expect(bloc.allArtists.value.first.name, artist.name);
  });

  test('Test dispose()', () async {
    ArtistsPageBloc bloc = ArtistsPageBloc();
    await bloc.init();

    bloc.dispose();

    expect(bloc.allArtists, isClosed);
  });
}
