import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

class SimInfo {
  static const MethodChannel _channel =
      const MethodChannel('flutter.moum.sim_info');

  static Future<String> get getAllowsVOIP async {
    bool value =  await _channel.invokeMethod('allowsVOIP');
    return value.toString();
  }

  static Future<String> get getCarrierName async {
    return await _channel.invokeMethod('carrierName');
  }

  static Future<String> get getIsoCountryCode async {
    return await _channel.invokeMethod('isoCountryCode');
  }

  static Future<String> get getMobileCountryCode async {
    return await _channel.invokeMethod('mobileCountryCode');
  }

  static Future<String> get getMobileNetworkCode async {
    return await _channel.invokeMethod('mobileNetworkCode');
  }

}
