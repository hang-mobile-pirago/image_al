import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

const isDebug = true;

// ************************
// API
// ************************

const apiBaseUrl = 'https://care-sweet-server.futureantiques.work/api';

// ************************
// App
// ************************

const appName = 'care sweet';

enum EnvironmentType {
  dev,
  prod;

  const EnvironmentType();

  bool get isDev => this == dev;

  bool get isProd => this == prod;
}

class AppConfig {
  static EnvironmentType? _current;

  static EnvironmentType get buildType => _current??EnvironmentType.dev;

  static Future<EnvironmentType> current() async {
    if (_current != null) {
      return _current!;
    }
    final packageInfo = await PackageInfo.fromPlatform();
    var packageName = packageInfo.packageName;
    debugPrint('---packagename $packageName');
    if (packageName.contains('staging')) {
      _current = EnvironmentType.dev;
      return _current!;
    }
    _current = EnvironmentType.prod;
    return _current!;
  }
}
