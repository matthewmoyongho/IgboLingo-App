import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:igbo_lang_tutor/data/repositories/authentication_repository.dart';
import 'package:igbo_lang_tutor/data/repositories/lecture_repository.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final repository = AuthenticationRepository();
  final videoRepository = LectureRepository();

  bool showHome = false;
  runApp(App(
    repository: repository,
    showHome: showHome,
    videoRepository: videoRepository,
  ));
}
