/*
 * Author: Alexander Dunbar
 * Date: 2022-10-21, 10:04 p.m.
 */

import 'package:flutter/material.dart';
import 'package:music_player/models/artist.dart';
import 'package:music_player/pages/artists_page/artist_page_bloc.dart';
import 'package:music_player/utils/locator.dart';

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
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: StreamBuilder<List<Artist>>(
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
                  itemCount: allArtists.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(allArtists[index].name),
                    );
                  },
                );
              }),
        ),
      ),
    );
  }
}
