import 'package:flutter/material.dart';
import 'tabScreen.dart';
import 'payment.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabScreen(),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/payment': (context) => Payment(),
        // When navigating to the "/second" route, build the SecondScreen widget.
//        '/second': (context) => SecondScreen(),
      },
    );
  }
}