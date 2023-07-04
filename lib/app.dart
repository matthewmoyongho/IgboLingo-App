import 'package:flutter/material.dart';
import 'package:igbo_lang_tutor/data/repositories/authentication_repository.dart';

import './domain/business_logic/blocs/authentication/authentication_view.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.repository}) : super(key: key);

  final AuthenticationRepository repository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IgboLingo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AuthenticationView(
        repository: repository,
      ),
      // const HomeScreen(
      //   title: 'IgboLingua',
      // ),
    );
  }
}
