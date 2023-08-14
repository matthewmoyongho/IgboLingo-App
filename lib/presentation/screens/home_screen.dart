import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:igbo_lang_tutor/domain/business_logic/blocs/authentication/authentication_bloc.dart';
import 'package:igbo_lang_tutor/domain/business_logic/blocs/authentication/authentication_event.dart';

import './lecture_screen.dart';
import '../../domain/business_logic/blocs/authentication/authentication_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    context.read<AuthenticationBloc>().add(LogoutRequest());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => LectureScreen(),
                ),
              ),
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.red,
                alignment: Alignment.center,
                child: const Text(
                  'click here to navigate',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton:
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          return FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          );
        },
      ),
    );
  }
}
