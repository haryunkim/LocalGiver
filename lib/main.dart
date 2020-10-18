import 'package:flutter/material.dart';
import 'package:smartup/welcomeScreen.dart';
import 'welcomeScreen.dart';
import 'payment.dart';
import 'tabScreen.dart';
import 'signup.dart';
import 'login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(),
      routes: {
        '/tabScreen': (context) => TabScreen(),
        '/payment': (context) => Payment(),
        '/login': (context) => LogIn(),
        '/signup': (context) => SignUp(),
      },
    );
  }
}


