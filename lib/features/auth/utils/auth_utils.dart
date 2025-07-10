import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fitted/config/helper/flutter_toast/show_toast.dart';
import 'package:fitted/config/storage/app_storage.dart';

class AuthUtils {
  static Future<String> getFcmToken() async {
    final token = await FirebaseMessaging.instance.getToken();
    return token ?? '';
  }

  static GoogleSignIn getGoogleSignIn() {
    return Platform.isAndroid
        ? GoogleSignIn(
            clientId:
                "582529657919-kb8675mbd6930u4oamgd9iolplmhedko.apps.googleusercontent.com",
          )
        : GoogleSignIn();
  }

  static void handleToast(String message) {
    ToastUtil.showToast(message: message);
  }

  static void persistAuthData({
    required String accessToken,
    required String userId,
    String? fit,
  }) {
    SharedPrefsStorage.setToken(accessToken);
    SharedPrefsStorage.setUserId(userId);
    if (fit != null) SharedPrefsStorage.setUserFit(fit);
  }
}
