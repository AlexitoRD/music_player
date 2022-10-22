/*
 * Author: Alexander Dunbar
 * Date: 2022-10-22, 5:23 p.m.
 */

/*
 * Author: Alexander Dunbar
 * Date: 2022-10-22, 5:15 p.m.
 */

import 'package:music_player/utils/events/events.dart';
import 'package:rxdart/rxdart.dart';

class GlobalEventBus {
  static final PublishSubject<GlobalEvent> _events =
      PublishSubject<GlobalEvent>();

  static Stream<GlobalEvent> get events => _events;

  static void sendEvent(GlobalEvent event) => _events.add(event);
}
