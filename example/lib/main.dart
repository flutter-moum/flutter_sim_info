import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:sim_info/sim_info.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String _allowsVOIP;
  String _carrierName;
  String _isoCountryCode;
  String _mobileCountryCode;
  String _mobileNetworkCode;

  @override
  void initState() {
    super.initState();
    getUsimInfo();
  }

  Future<String> getUsimInfo() async {
    String allowsVOIP = await SimInfo.AllowsVOIP;
    String carrierName = await SimInfo.AllowsVOIP;
    String isoCountryCode = await SimInfo.AllowsVOIP;
    String mobileCountryCode = await SimInfo.AllowsVOIP;
    String mobileNetworkCode = await SimInfo.AllowsVOIP;

    setState(() {
      _allowsVOIP = allowsVOIP;
      _carrierName = carrierName;
      _isoCountryCode = isoCountryCode;
      _mobileCountryCode = mobileCountryCode;
      _mobileNetworkCode = mobileNetworkCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('USIM Infomation Plugin'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text('VOIP : $_allowsVOIP '),
              Text('CarrierName : $_carrierName'),
              Text('ISO CountryCode : $_isoCountryCode'),
              Text('Mobile CountryCode : $_mobileCountryCode'),
              Text('Mobile NetworkCode : $_mobileNetworkCode'),
            ],
          )
        ),
      ),
    );
  }
}
