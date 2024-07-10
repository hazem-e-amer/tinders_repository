import 'package:flutter/foundation.dart';
import 'package:local_auth/local_auth.dart';

class AuthFinger {
  static final _auth = LocalAuthentication();

  ///check if can use finger print
  static Future<bool> canAuthenticate() async =>
      await _auth.canCheckBiometrics || await _auth.isDeviceSupported();

  static Future<bool> authenticate() async {
    try {
      if (!await canAuthenticate()) return false;
      return await _auth.authenticate(localizedReason: 'auth');
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }
}
