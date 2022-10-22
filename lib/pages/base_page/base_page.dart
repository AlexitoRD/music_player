/*
 * Author: Alexander Dunbar
 * Date: 2022-10-22, 4:48 p.m.
 */

/*
 * Author: Alexander Dunbar
 * Date: 2022-10-22, 4:17 p.m.
 */

import 'package:flutter/material.dart';
import 'package:music_player/pages/base_page/bottom_nav_bar_items.dart';

class BasePage extends StatefulWidget {
  const BasePage();

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _selectedPage = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottomNavBarItems.pages[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        items: BottomNavBarItems.items,
        currentIndex: _selectedPage,
        onTap: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
      ),
    );
  }
}
