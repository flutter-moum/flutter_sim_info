import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

class SimInfo {
  static const MethodChannel _channel =
      const MethodChannel('flutter.moum.sim_info');

  static Future<String> get AllowsVOIP async {
    bool value;
    try {
      if (Platform.isIOS) {
        value = await _channel.invokeMethod('allowsVOIP');
      }
      else if (Platform.isAndroid) {
        value = await _channel.invokeMethod('allowsVOIP');
      }
      return value.toString();
    } on PlatformException catch(e) {
      return e.code;
    }
  }

  static Future<String> get getCarrierName async {
    String value;
    try {
      if (Platform.isIOS) {
        value = await _channel.invokeMethod('carrierName');
      }
      else if (Platform.isAndroid) {
        value = await _channel.invokeMethod('carrierName');
      }
      return value;
    } on PlatformException catch(e) {
      return e.code;
    }
  }

  static Future<String> get getIsoCountryCode async {
    String value;
    try {
      if (Platform.isIOS) {
        value = await _channel.invokeMethod('isoCountryCode');
      }
      else if (Platform.isAndroid) {
        value = await _channel.invokeMethod('isoCountryCode');
      }
      return value;
    } on PlatformException catch(e) {
      return e.code;
    }
  }

  static Future<String> get getMobileCountryCode async {
    String value;
    try {
      if (Platform.isIOS) {
        value = await _channel.invokeMethod('mobileCountryCode');
      }
      else if (Platform.isAndroid) {
        value = await _channel.invokeMethod('mobileCountryCode');
      }
      return value;
    } on PlatformException catch(e) {
      return e.code;
    }
  }

  static Future<String> get getMobileNetworkCode async {
    String value;
    try {
      if (Platform.isIOS) {
        value = await _channel.invokeMethod('mobileNetworkCode');
      }
      else if (Platform.isAndroid) {
        value = await _channel.invokeMethod('mobileNetworkCode');
      }
      return value;
    } on PlatformException catch(e) {
      return e.code;
    }
  }

  static Future<String> get carrierName async {
    final String carrierName = await _channel.invokeMethod('carrierName');
    return carrierName;
  }
}
