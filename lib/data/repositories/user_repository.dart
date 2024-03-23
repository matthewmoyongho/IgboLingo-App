import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user.dart' as localUser;

class UserRepository {
  final FirebaseFirestore _firestore;
  final String? _uid;
  final User? user = FirebaseAuth.instance.currentUser;

  UserRepository({FirebaseFirestore? firestore, String? uid})
      : _firestore = firestore ?? FirebaseFirestore.instance,
        _uid = uid ?? FirebaseAuth.instance.currentUser!.uid;

  Future<localUser.User?> getUserDetails({String? uid}) async {
    localUser.User? user;
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('User').doc(uid).get();
      if (snapshot.exists) {
        user = localUser.User.fromJson(snapshot.data()!);
      }
    } catch (e) {
      print(e);
    }
    return user;
  }

  Future<void> updateUserDetails(localUser.User user, {String? uid}) async {
    final usersRef = _firestore.collection('User').doc(uid ?? _uid);

    try {
      usersRef.update(
        localUser.User.toMap(user),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addUserUserDetails(localUser.User user, String? uid) async {
    final usersRef = _firestore.collection('User');
    if (await getUserDetails(uid: uid!) != null) return;
    try {
      usersRef.doc(user.id).set(
            localUser.User.toMap(user),
          );
    } catch (e) {
      rethrow;
    }
  }
}
