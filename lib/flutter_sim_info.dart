import 'dart:async';

import 'package:flutter/services.dart';

class FlutterSimInfo {
  static const MethodChannel _channel =
      const MethodChannel('flutter_sim_info');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
