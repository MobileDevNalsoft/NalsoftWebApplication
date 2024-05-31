import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nalsoft_web_application/blocs/authentication/bloc/login_bloc.dart';
import 'package:nalsoft_web_application/views/authentication/login.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => LoginBloc(),
      )
    ],
    child: const MaterialApp(
      home: LoginPage(),
    ),
  ));
}
