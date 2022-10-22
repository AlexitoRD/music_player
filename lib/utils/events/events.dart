/*
 * Author: Alexander Dunbar
 * Date: 2022-10-22, 5:23 p.m.
 */

abstract class GlobalEvent {}

class PlayEvent extends GlobalEvent {
  final String filePath;

  PlayEvent({required this.filePath});
}
