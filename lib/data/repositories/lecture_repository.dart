import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:igbo_lang_tutor/data/models/video.dart';

class LectureRepository {
  // final storage = FirebaseStorage.instance.ref();
  final FirebaseFirestore _storage;
  final String _uid;
  LectureRepository({FirebaseFirestore? storage, String? uid})
      : _storage = storage ?? FirebaseFirestore.instance,
        _uid = uid ?? FirebaseAuth.instance.currentUser!.uid;

  Future<List<Video>> getAllVideos() async {
    List<Video> videos = [];

    try {
      QuerySnapshot snapshot = await _storage
          .collection('Topics')
          .doc('KLz8HvCYKG0O2IKLINjr')
          .collection('Greetings')
          .get();

      for (var doc in snapshot.docs) {
        videos.add(Video.fromJson(doc));
      }
    } catch (e) {
      print('Operation failed');
    }

    return videos;
  }
}
