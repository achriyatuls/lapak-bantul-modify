import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../config/env.dart';

class AuthService {
  static bool _googleReady = false;

  static Future<User?> signInWithGoogle() async {
    if (Firebase.apps.isEmpty) {
      throw Exception('Firebase belum dikonfigurasi.');
    }

    if (kIsWeb) {
      return _signInWithGoogleWeb();
    }

    return _signInWithGoogleMobile();
  }

  static Future<User?> _signInWithGoogleWeb() async {
    debugPrint('[AuthService] Web: signInWithPopup...');
    try {
      final provider = GoogleAuthProvider();
      final result = await FirebaseAuth.instance.signInWithPopup(provider);
      debugPrint('[AuthService] Web: sign-in success: ${result.user?.email}');
      return result.user;
    } on FirebaseAuthException catch (e) {
      debugPrint('[AuthService] Web FirebaseAuthException: code=${e.code}, message=${e.message}');
      if (e.code == 'popup-closed-by-user' || e.code == 'cancelled-popup-request') {
        return null;
      }
      throw Exception('Google Sign-In gagal (${e.code}): ${e.message}');
    } catch (e) {
      debugPrint('[AuthService] Web unexpected error: $e');
      throw Exception('Google Sign-In gagal: $e');
    }
  }

  static Future<User?> _signInWithGoogleMobile() async {
    debugPrint('[AuthService] Mobile: Initializing GoogleSignIn...');
    if (!_googleReady) {
      await GoogleSignIn.instance.initialize(
        serverClientId: Env.googleServerClientId,
      );
      _googleReady = true;
    }

    final GoogleSignInAccount googleUser;
    try {
      googleUser = await GoogleSignIn.instance.authenticate();
    } on GoogleSignInException catch (e) {
      debugPrint('[AuthService] GoogleSignInException: code=${e.code.name}, desc=${e.description}');
      if (e.code == GoogleSignInExceptionCode.canceled) return null;
      throw Exception('Google Sign-In gagal (${e.code.name}): ${e.description}');
    } catch (e) {
      debugPrint('[AuthService] Mobile unexpected error: $e');
      throw Exception('Google Sign-In gagal: $e');
    }

    debugPrint('[AuthService] Got Google user: ${googleUser.email}');

    final idToken = googleUser.authentication.idToken;
    if (idToken == null) {
      throw Exception('ID token null. Pastikan Google Sign-In diaktifkan di Firebase Authentication.');
    }

    try {
      final credential = GoogleAuthProvider.credential(idToken: idToken);
      final result = await FirebaseAuth.instance.signInWithCredential(credential);
      debugPrint('[AuthService] Firebase sign-in success: ${result.user?.email}');
      return result.user;
    } on FirebaseAuthException catch (e) {
      debugPrint('[AuthService] FirebaseAuthException: code=${e.code}, message=${e.message}');
      throw Exception('Firebase Auth gagal (${e.code}): ${e.message}');
    }
  }

  static Future<void> signOut() async {
    if (!kIsWeb && _googleReady) await GoogleSignIn.instance.signOut();
    if (Firebase.apps.isNotEmpty) await FirebaseAuth.instance.signOut();
  }
}
