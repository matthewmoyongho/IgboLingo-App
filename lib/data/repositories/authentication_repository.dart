import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_sign_in/google_sign_in.dart';

import '../../core/cache.dart';
import '../models/user.dart' as appUser;

class SignUpWithEmailAndPasswordError implements Exception {
  final String message;
  const SignUpWithEmailAndPasswordError(
      [this.message = 'An Unknown error occurred']);
  factory SignUpWithEmailAndPasswordError.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordError(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordError(
          'This user has been disabled. Please contact support for help.',
        );
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordError(
          'An account already exists for that email.',
        );
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordError(
          'Operation is not allowed.  Please contact support.',
        );
      case 'weak-password':
        return const SignUpWithEmailAndPasswordError(
          'Please enter a stronger password.',
        );
      default:
        return const SignUpWithEmailAndPasswordError();
    }
  }
}

class LogInWithGoogleError implements Exception {
  final String errorMessage;
  const LogInWithGoogleError(
      [this.errorMessage = 'An unknown exception occurred']);
  factory LogInWithGoogleError.fromCode(String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return const LogInWithGoogleError(
          'Account exists with different credentials.',
        );
      case 'invalid-credential':
        return const LogInWithGoogleError(
          'The credential received is malformed or has expired.',
        );
      case 'operation-not-allowed':
        return const LogInWithGoogleError(
          'Operation is not allowed.  Please contact support.',
        );
      case 'user-disabled':
        return const LogInWithGoogleError(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LogInWithGoogleError(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const LogInWithGoogleError(
          'Incorrect password, please try again.',
        );
      case 'invalid-verification-code':
        return const LogInWithGoogleError(
          'The credential verification code received is invalid.',
        );
      case 'invalid-verification-id':
        return const LogInWithGoogleError(
          'The credential verification ID received is invalid.',
        );
      default:
        return const LogInWithGoogleError();
    }
  }
}

class LoginWithEmailAndPasswordError implements Exception {
  final String message;
  const LoginWithEmailAndPasswordError(
      [this.message = 'Failed to login. An unknown exception occurred']);
  factory LoginWithEmailAndPasswordError.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const LoginWithEmailAndPasswordError(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const LoginWithEmailAndPasswordError(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LoginWithEmailAndPasswordError(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const LoginWithEmailAndPasswordError(
          'Incorrect password, please try again.',
        );
      default:
        return const LoginWithEmailAndPasswordError();
    }
  }
}

class AuthenticationRepository {
  FirebaseAuth _firebaseAuth;
  CacheClient _cacheClient;
  final GoogleSignIn _googleSignIn;
  final FirebaseFirestore _firestore;

  AuthenticationRepository(
      {String? uid,
      FirebaseAuth? firebaseAuth,
      GoogleSignIn? googleSignIn,
      FirebaseFirestore? firestore,
      CacheClient? cacheClient})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn(),
        _cacheClient = cacheClient ?? CacheClient();

  bool isWeb = kIsWeb;

  static const userCacheKey = '__user_cache_key__';

  Stream<appUser.User> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final appUser.User user =
          firebaseUser == null ? appUser.User.empty : firebaseUser.toUser;
      _cacheClient.write(key: userCacheKey, value: user);
      return user;
    });
  }

  appUser.User get currentUser {
    return _cacheClient.read<appUser.User>(key: userCacheKey) ??
        appUser.User.empty;
  }

  Future<User?> signUp(
      {required String email, required String password}) async {
    User? user;
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      user = result.user;
    } on FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordError.fromCode(e.code);
    } catch (_) {
      throw const SignUpWithEmailAndPasswordError();
    }
    return user;
  }

  Future<void> login(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw LoginWithEmailAndPasswordError.fromCode(e.code);
    } catch (_) {
      throw const LoginWithEmailAndPasswordError();
    }
  }

  Future<User?> googleLogin() async {
    User? userDetail;
    try {
      late final AuthCredential authCredential;
      if (kIsWeb) {
        final googleProvider = GoogleAuthProvider();
        final userCredentials =
            await _firebaseAuth.signInWithPopup(googleProvider);
        authCredential = userCredentials.credential!;
      } else {
        final googleUser = await _googleSignIn.signIn();
        final googleAuth = await googleUser!.authentication;
        authCredential = GoogleAuthProvider.credential(
            idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
      }
      await _firebaseAuth.signOut();
      final user = await _firebaseAuth.signInWithCredential(authCredential);
      userDetail = user.user!;
    } on FirebaseAuthException catch (e) {
      throw LogInWithGoogleError.fromCode(e.code);
    } catch (_) {
      throw LogInWithGoogleError();
    }
    return userDetail;
  }

  Future<void> logout() async {
    try {
      Future.wait([_firebaseAuth.signOut()]);
    } catch (e) {
      rethrow;
    }
  }

  // Future<appUser.User?> getUserDetails() async {
  //   appUser.User? user;
  //   try {
  //     DocumentSnapshot<Object?> snapshot =
  //         await _firestore.collection('User').doc(_uid).get();
  //
  //     user = appUser.User.fromJson(snapshot.data() as DocumentSnapshot<Object>);
  //   } catch (e) {
  //     print(e);
  //   }
  //   return user;
  // }
}

extension on User {
  appUser.User get toUser {
    return appUser.User(id: uid, name: displayName, email: email);
  }
}
