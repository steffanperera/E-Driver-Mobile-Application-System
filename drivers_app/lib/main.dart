import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:drivers_app/screens/welcome_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
