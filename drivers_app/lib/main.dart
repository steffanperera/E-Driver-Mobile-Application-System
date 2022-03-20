import 'package:flutter/material.dart';
import 'package:drivers_app/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Driver's App",
      theme: ThemeData(
        // default colors
        primarySwatch: Colors.blue,

        // default font family
        fontFamily: 'Montserrat',
      ),
      home: const WelcomeScreen(),
    );
  }
}
