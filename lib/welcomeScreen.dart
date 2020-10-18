import 'package:flutter/material.dart';
import 'roundedButton.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 350,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/giving.png')
                          )
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 55),
                  child: Text(
                    'Local Giver',
                    style: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30,),
            Center(
              child: RoundedButton(title: 'Log In', colour: Colors.pinkAccent, onPressed: () {
                Navigator.of(context).pushNamed(
                    '/login');
              }),
            ),
            Center(
              child: RoundedButton(title: 'Create Account', colour: Colors.pink, onPressed: () {
                Navigator.of(context).pushNamed(
                    '/signup');
              }),
            ),
          ],
        ),
      ),
    );
  }
}
