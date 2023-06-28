// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'authentication_bloc.dart';
// import 'authentication_event.dart';
// import 'authentication_state.dart';
//
// class AuthenticationPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) => AuthenticationBloc()..add(InitEvent()),
//       child: Builder(builder: (context) => _buildPage(context)),
//     );
//   }
//
//   Widget _buildPage(BuildContext context) {
//     final bloc = BlocProvider.of<AuthenticationBloc>(context);
//
//     return Container();
//   }
// }
//
