/*
 * Author: Alexander Dunbar
 * Date: 2022-10-22, 4:11 p.m.
 */

/*
 * Author: Alexander Dunbar
 * Date: 2022-10-18, 8:14 p.m.
 */

import 'package:flutter/material.dart';
import 'package:music_player/widgets/main_menu_drawer/main_menu_drawer.dart';
import 'package:music_player/widgets/player/player_widget.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage();

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: MainMenuDrawer(),
      body: PlayerWidget(),
    );
  }
}
