
# flutter_sim_info

예시사항입니다.

[![pub package](https://img.shields.io/pub/v/url_launcher.svg)](https://pub.dartlang.org/packages/url_launcher) <- 이런것도 달아주고

A Flutter plugin for read SIM information.

*Note*: 안드로이드와 iOS 에서 가져올 수  있는 데이터에 차이가 있습니다.

## Usage

### Import the package
To use this plugin, follow the [plugin installation instructions](https://pub.dartlang.org/packages/google_sign_in#pub-pkg-tab-installing).

### Use the plugin
Add the following import to your Dart code:

```dart
import 'package:flutter_sim_info/flutter_sim_info.dart';
```

Initialize GoogleSignIn with the scopes you want:

```dart
GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);
```
[Full list of available scopes](https://developers.google.com/identity/protocols/googlescopes).

You can now use the `GoogleSignIn` class to authenticate in your Dart code, e.g.

```dart
Future<void> _handleSignIn() async {
  try {
    await _googleSignIn.signIn();
  } catch (error) {
    print(error);
  }
}
```

### Android integration

api 23 이상부터 권한이 필요하다는 이야기.
Dangerous permissions [READ_PHONE_STATE](https://developer.android.com/reference/android/Manifest.permission.html#READ_PHONE_STATE)
```dart
Show<Permission> _request() {
  // 퍼미션 요청하는 코드
}
```

## Screenshots

스크린샷 몇장 넣어줌(gif ??)

## API details

See the [google_sign_in.dart](https://github.com/flutter/plugins/blob/master/packages/google_sign_in/lib/google_sign_in.dart) for more API details.

어떤 정보를 확인할 수 잇는지 안드로이드 해당 클래스 페이지, iOS 해당 클래스 페이지를 연결해주던가 정보를 정리해서 깃헙 정적페이지 혹은 위키로 만들면 될것같음

## Issues and feedback

Please file [issues](https://github.com/flutter-moum/flutter_sim_info/issues/new)
to send feedback or report a bug. Thank you!

## License

아파치 혹은 MIT 등 적용
