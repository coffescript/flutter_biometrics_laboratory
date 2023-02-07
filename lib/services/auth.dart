import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class AuthService {
  static Future<dynamic> authenticateUser() async {
    //initialize Local Authentication plugin.
    final LocalAuthentication _localAuthentication = LocalAuthentication();

    // status of authentication
    bool isAuthenticated = false;

    // check if device supports biometrics authentication
    bool isBiometricSupported = await _localAuthentication.isDeviceSupported();

    List<BiometricType> biometricType =
        await _localAuthentication.getAvailableBiometrics();

    print(biometricType);

    // if device supports biometrics, then authenticate.
    if (isBiometricSupported) {
      try {
        isAuthenticated = await _localAuthentication.authenticate(
          localizedReason: 'To continue, you must',
          options: const AuthenticationOptions(
              biometricOnly: true, useErrorDialogs: true, stickyAuth: true),
        );
      } on PlatformException catch (e) {
        print(e);
      }

      return isAuthenticated;
    }
  }
}
