/*
 * Author: Alexander Dunbar
 * Date: 2022-10-18, 10:59 p.m.
 */

import 'package:flutter/material.dart';

class AlbumArtWidget extends StatefulWidget {
  const AlbumArtWidget();

  @override
  State<AlbumArtWidget> createState() => _AlbumArtWidgetState();
}

class _AlbumArtWidgetState extends State<AlbumArtWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Icon(Icons.image));
  }
}
