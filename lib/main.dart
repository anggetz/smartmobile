import 'package:flutter/material.dart';
import 'package:smart/modules/auth/screens/login.dart';
import 'package:smart/modules/auth/screens/register_form.dart';
import 'package:smart/modules/common/screens/home.dart';
import 'package:smart/modules/kas/screens/kas.dart';
import 'package:smart/modules/layouts/screens/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => Login(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/register-form': (context) => RegisterForm(),
        '/home': (context) => Home(),
        '/kas': (context) => Kas(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
    );
  }
}

