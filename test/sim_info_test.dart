import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sim_info/sim_info.dart';

void main() {
  const MethodChannel channel = MethodChannel('sim_info');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await SimInfo.platformVersion, '42');
  });
}
