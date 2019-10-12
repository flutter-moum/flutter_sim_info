import 'package:flutter/material.dart';
import 'dart:async';

import 'package:sim_info/sim_info.dart';
import 'package:permission_handler/permission_handler.dart';

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

//    var permissionNames = await Permission.requestPermissions([PermissionName.Calendar, PermissionName.Camera]);

//    Permission.openSettings;
    if (hasPermission()) {
      getUsimInfo();
    } else {
    }
  }

  Future<bool> hasPermission() async {
    PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.contacts);
    return permission.value == PermissionStatus.granted.value;

  }
  
  Future<void> requestPermission() async {
    Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([PermissionGroup.contacts]);
    permissions.forEach(f)
  }

  Future<void> getUsimInfo() async {
    String allowsVOIP = await SimInfo.getAllowsVOIP;
    String carrierName = await SimInfo.getCarrierName;
    String isoCountryCode = await SimInfo.getIsoCountryCode;
    String mobileCountryCode = await SimInfo.getMobileCountryCode;
    String mobileNetworkCode = await SimInfo.getMobileNetworkCode;

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
        )),
      ),
    );
  }
}
