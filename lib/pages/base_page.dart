/*
 * Author: Alexander Dunbar
 * Date: 2022-10-18, 8:14 p.m.
 */

import 'package:flutter/material.dart';
import 'package:music_player/widgets/main_menu_drawer.dart';

class BasePage extends StatefulWidget {
  const BasePage();

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: SafeArea(
        child: MainMenuDrawer(),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('M P'),
      ),
      body: Container(),
    );
  }
}
