import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_sim_info/flutter_sim_info.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_sim_info');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FlutterSimInfo.platformVersion, '42');
  });
}
