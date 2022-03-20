import 'package:flutter/material.dart';
import 'package:police_app/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E Officer',
      theme: ThemeData(
        // default color
        primarySwatch: Colors.blue,

        // default font family
        fontFamily: 'Montserrat',
      ),
      home: const WelcomeScreen(),
    );
  }
}
