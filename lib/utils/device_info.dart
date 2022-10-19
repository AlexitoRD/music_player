/*
 * Author: Alexander Dunbar
 * Date: 2022-10-18, 11:39 p.m.
 */

import 'package:flutter/cupertino.dart';

class DeviceInfo {
  final BuildContext context;
  const DeviceInfo(this.context);

  double get deviceWidth {
    return MediaQuery.of(context).size.width;
  }

  double get deviceHeight {
    return MediaQuery.of(context).size.height;
  }
}
