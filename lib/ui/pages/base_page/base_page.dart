/*
 * Author: Alexander Dunbar
 * Date: 2022-10-22, 4:48 p.m.
 */

import 'package:flutter/material.dart';
import 'package:music_player/ui/pages/base_page/bottom_nav_bar_items.dart';
import 'package:music_player/ui/sheets/settings_sheet.dart';
import 'package:music_player/utils/locator.dart';

import 'base_page_bloc.dart';

class BasePage extends StatefulWidget {
  const BasePage();

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  final BasePageBloc _bloc = locator<BasePageBloc>();
  int _selectedPage = 1;

  @override
  void initState() {
    super.initState();
    _bloc.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedPage,
        children: BottomNavBarItems.pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: BottomNavBarItems.items,
        currentIndex: _selectedPage,
        onTap: (index) {
          if (index == 2) {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return SettingsBottomSheet();
                });
          } else {
            setState(() {
              _selectedPage = index;
            });
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}
