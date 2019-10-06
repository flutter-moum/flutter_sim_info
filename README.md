
# flutter_sim_info


[![pub package](https://img.shields.io/pub/v/url_launcher.svg)](https://pub.dartlang.org/packages/url_launcher) <- 이런것도 달아주고

A Flutter plugin for read SIM information.  
You can get SIM data for MCC, MNC, country code, etc...

*Note*: There are similarities and differences between the data available on Android and iOS. Read the usage.

## Usage

### Import the package
To use this plugin, follow the [plugin installation instructions](https://pub.dev/packages/flutter_sim_info#-installing-tab-).

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

스크린샷 몇장 넣어줌(gif ??)

## API details

See the [WIKI](https://github.com/flutter-moum/flutter_sim_info/wiki) for more API details.

## Issues and feedback

Please file [issues](https://github.com/flutter-moum/flutter_sim_info/issues/new)
to send feedback or report a bug. Thank you!

## License

[MIT](https://github.com/flutter-moum/flutter_sim_info/issues/new) license.
