import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static String _get(String key, {String fallback = ''}) =>
      dotenv.env[key] ?? fallback;

  // ─── API ─────────────────────────────────────────────────────
  static String get apiBaseUrl => _get('API_BASE_URL');
  static String get apiKey => _get('API_KEY');

  // ─── Google OAuth ─────────────────────────────────────────────
  static String get googleServerClientId => _get('GOOGLE_SERVER_CLIENT_ID');

  // ─── Firebase Shared ──────────────────────────────────────────
  static String get firebaseProjectId => _get('FIREBASE_PROJECT_ID');
  static String get firebaseMessagingSenderId =>
      _get('FIREBASE_MESSAGING_SENDER_ID');
  static String get firebaseStorageBucket => _get('FIREBASE_STORAGE_BUCKET');

  // ─── Firebase Web ─────────────────────────────────────────────
  static String get firebaseWebApiKey => _get('FIREBASE_WEB_API_KEY');
  static String get firebaseWebAppId => _get('FIREBASE_WEB_APP_ID');
  static String get firebaseWebAuthDomain => _get('FIREBASE_WEB_AUTH_DOMAIN');
  static String get firebaseWebMeasurementId =>
      _get('FIREBASE_WEB_MEASUREMENT_ID');

  // ─── Firebase Android ─────────────────────────────────────────
  static String get firebaseAndroidApiKey => _get('FIREBASE_ANDROID_API_KEY');
  static String get firebaseAndroidAppId => _get('FIREBASE_ANDROID_APP_ID');

  // ─── Firebase iOS & macOS ─────────────────────────────────────
  static String get firebaseIosApiKey => _get('FIREBASE_IOS_API_KEY');
  static String get firebaseIosAppId => _get('FIREBASE_IOS_APP_ID');
  static String get firebaseIosClientId => _get('FIREBASE_IOS_CLIENT_ID');
  static String get firebaseIosBundleId => _get('FIREBASE_IOS_BUNDLE_ID');

  // ─── Firebase Windows ─────────────────────────────────────────
  static String get firebaseWindowsApiKey => _get('FIREBASE_WINDOWS_API_KEY');
  static String get firebaseWindowsAppId => _get('FIREBASE_WINDOWS_APP_ID');
  static String get firebaseWindowsMeasurementId =>
      _get('FIREBASE_WINDOWS_MEASUREMENT_ID');
}
