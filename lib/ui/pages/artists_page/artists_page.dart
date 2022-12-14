/*
 * Author: Alexander Dunbar
 * Date: 2022-10-21, 10:04 p.m.
 */

import 'package:flutter/material.dart';
import 'package:music_player/models/artist.dart';
import 'package:music_player/models/song.dart';
import 'package:music_player/ui/widgets/cells/song_cell.dart';
import 'package:music_player/utils/locator.dart';

import 'artist_page_bloc.dart';

class ArtistsPage extends StatefulWidget {
  const ArtistsPage();

  @override
  State<ArtistsPage> createState() => _ArtistsPageState();
}

class _ArtistsPageState extends State<ArtistsPage> {
  final ArtistsPageBloc _bloc = locator<ArtistsPageBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.init();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Artist>>(
      stream: _bloc.allArtists,
      builder: (context, snapshot) {
        final allArtists = snapshot.data;
        if (allArtists == null) {
          return CircularProgressIndicator(
            color: Colors.red,
          );
        }
        if (allArtists.isEmpty) {
          return CircularProgressIndicator(
            color: Colors.green,
          );
        }
        return ListView.builder(
          shrinkWrap: true,
          itemCount: allArtists.length,
          itemBuilder: (context, index) {
            return ExpansionTile(
              key: Key('ArtistTile'),
              title: Text(allArtists[index].name),
              onExpansionChanged: (value) {
                if (value) {
                  _bloc.getSongsForArtist(allArtists[index].name);
                }
              },
              children: [
                StreamBuilder<List<Song>>(
                  stream: _bloc.songsForArtist,
                  builder: (context, snapshot) {
                    final songsForArtist = snapshot.data;
                    if (songsForArtist == null) {
                      return CircularProgressIndicator(
                        color: Colors.red,
                      );
                    }
                    if (songsForArtist.isEmpty) {
                      return CircularProgressIndicator(
                        color: Colors.green,
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: songsForArtist.length,
                      itemBuilder: (context, index) {
                        final song = songsForArtist[index];
                        return SongCell(
                            song: song,
                            removeSong: _bloc.removeSong,
                            playSong: _bloc.playSong);
                      },
                    );
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
