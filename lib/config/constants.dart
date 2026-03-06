import 'dart:io';

class Constants {
  static final String host = Platform.isIOS
      ? "localhost:3000"
      : "10.0.2.2:3000";

  static final String accessToken = 'app_access_token';
}
