// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// import '../models/user.dart' as localUser;
//
// class UserRepository {
//   final FirebaseFirestore _firestore;
//   final String _uid;
//
//   UserRepository({FirebaseFirestore? firestore, String? uid})
//       : _firestore = firestore ?? FirebaseFirestore.instance,
//         _uid = uid ?? FirebaseAuth.instance.currentUser!.uid;
//
//   Future<localUser.User?> getUserDetails() async {
//     localUser.User? user;
//     try {
//       DocumentSnapshot<Object?> snapshot =
//           await _firestore.collection('User').doc(_uid).get();
//
//       user =
//           localUser.User.fromJson(snapshot.data() as DocumentSnapshot<Object>);
//     } catch (e) {
//       print(e);
//     }
//     return user;
//   }
// }
//
// Future<void> updateUserDetails ()
