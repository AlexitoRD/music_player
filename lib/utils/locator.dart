/*
 * Author: Alexander Dunbar
 * Date: 2022-10-21, 11:53 p.m.
 */
import 'package:get_it/get_it.dart';
import 'package:music_player/database_service/database_service.dart';

final locator = GetIt.instance;

void setUp() {
  locator.registerFactory<DatabaseService>(() => DatabaseService());
}
