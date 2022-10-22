/*
 * Author: Alexander Dunbar
 * Date: 2022-10-21, 10:04 p.m.
 */

import 'package:flutter/material.dart';

class ArtistsPage extends StatefulWidget {
  const ArtistsPage();

  @override
  State<ArtistsPage> createState() => _ArtistsPageState();
}

class _ArtistsPageState extends State<ArtistsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile();
          },
        ),
      ),
    );
  }
}
