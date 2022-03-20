import 'package:flutter/material.dart';
import 'package:drivers_app/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // application root.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E Driver',
      theme: ThemeData(

          // default color
          primarySwatch: Colors.blue,

          // default font family
          fontFamily: 'Montserrat'),
      home: const WelcomeScreen(),
    );
  }
}
