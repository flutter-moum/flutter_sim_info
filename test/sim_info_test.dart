import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sim_info/sim_info.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter.moum.sim_info');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'allowsVOIP') return true;
      if (methodCall.method == 'carrierName') return 'KT';
      if (methodCall.method == 'isoCountryCode') return 'kr';
      if (methodCall.method == 'mobileCountryCode') return '450';
      if (methodCall.method == 'mobileNetworkCode') return '05';
      return '';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('get 5 sim info method', () async {
    expect(await SimInfo.getAllowsVOIP, 'true');
    expect(await SimInfo.getCarrierName, 'KT');
    expect(await SimInfo.getIsoCountryCode, 'kr');
    expect(await SimInfo.getMobileCountryCode, '450');
    expect(await SimInfo.getMobileNetworkCode, '05');
  });
}
