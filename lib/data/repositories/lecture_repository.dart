import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:igbo_lang_tutor/data/models/video.dart';

class LectureRepository {
  // final storage = FirebaseStorage.instance.ref();
  final FirebaseFirestore _storage;
  LectureRepository({FirebaseFirestore? storage})
      : _storage = storage ?? FirebaseFirestore.instance;

  Future<List<Video>> getAllVideos() async {
    List<Video> videos = [];

    try {
      print('I started');
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
