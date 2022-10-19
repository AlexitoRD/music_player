/*
 * Author: Alexander Dunbar
 * Date: 2022-10-18, 11:01 p.m.
 */

import 'package:flutter/material.dart';

class ControlsWidget extends StatefulWidget {
  const ControlsWidget();

  @override
  State<ControlsWidget> createState() => _ControlsWidgetState();
}

class _ControlsWidgetState extends State<ControlsWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.keyboard_double_arrow_left),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.pause),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.keyboard_double_arrow_right),
        ),
      ],
    );
  }
}
