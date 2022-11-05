/*
 * Author: Alexander Dunbar
 * Date: 2022-11-04, 9:37 p.m.
 */

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_player/utils/device_info.dart';

void main() {
  testWidgets('Test device width', (widgetTester) async {
    widgetTester.binding.window.physicalSizeTestValue = Size(666, 999);
    late double width;
    await widgetTester.pumpWidget(MaterialApp(
      home: Builder(builder: (BuildContext context) {
        DeviceInfo deviceInfo = DeviceInfo(context);
        width = deviceInfo.deviceWidth;
        return Container();
      }),
    ));

    expect(width, 222);
  });

  testWidgets('Test device height', (widgetTester) async {
    widgetTester.binding.window.physicalSizeTestValue = Size(666, 999);
    late double height;
    await widgetTester.pumpWidget(MaterialApp(
      home: Builder(builder: (BuildContext context) {
        DeviceInfo deviceInfo = DeviceInfo(context);
        height = deviceInfo.deviceHeight;
        return Container();
      }),
    ));

    expect(height, 333);
  });
}
