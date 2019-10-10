
# flutter_sim_info


A Flutter plugin for read SIM information.  
You can get SIM data for MCC, MNC, country name, etc...

*Note*: There are similarities and differences between the data available on Android and iOS. Read the usage.

## Usage

### Import the package
In your flutter project add the dependency:
```yml
dependencies:
  ...
  sim_info: ^0.0.1
```
Or check the [installing page](https://pub.dev/packages/sim_info#-installing-tab-).

### Use the plugin
Add the following import to your Dart code:

```dart
import 'package:sim_info/sim_info.dart';
```

Use below to get SIM data:

```dart
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

  void getUsimInfo() async {
    String allowsVOIP = await SimInfo.getAllowsVOIP;
    String carrierName = await SimInfo.getCarrierName;
    String isoCountryCode = await SimInfo.getIsoCountryCode;
    String mobileCountryCode = await SimInfo.getMobileCountryCode;
    String mobileNetworkCode = await SimInfo.getMobileNetworkCode;
  }
```
[Full list of available SIM data](https://github.com/flutter-moum/flutter_sim_info/wiki).

### Android integration

Beginning with Android 6.0 (API level 23), you must obtain bellow permission before using methods.

Dangerous permissions [READ_PHONE_STATE](https://developer.android.com/reference/android/Manifest.permission.html#READ_PHONE_STATE)

### Error message

```dart
"PERMISSION_DENIED" // In android, you use methods before get permission.

"SIM_STATE_NOT_READY" // In android, cannot found SIM card in your device.

"Sim card not detected" // In iOS, cannot found SIM card in your device.
```

## Screenshots
<div>
  <img width="200" src="/README/android_screenshot.jpg">
  <img width="200" src="/README/ios_screenshot.jpg">
</div>

## API details

See the [WIKI](https://github.com/flutter-moum/flutter_sim_info/wiki) for more API details.

## Issues and feedback

Please file [issues](https://github.com/flutter-moum/flutter_sim_info/issues/new)
to send feedback or report a bug. Thank you!

## License

[MIT](https://mit-license.org) license.
