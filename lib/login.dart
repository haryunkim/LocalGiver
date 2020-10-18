import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            SizedBox(height: 200),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 20.0
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    'Welcome Back',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40,),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: Colors.grey[100]
                        ),
                      ),
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if(value.isEmpty || !value.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        email = value;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email",
                        hintStyle: TextStyle(
                            color: Colors.grey
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: Colors.grey[100]
                        ),
                      ),
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if(value.isEmpty) {
                          return 'Please enter a password';
                        }
                        return null;
                      },
                      obscureText: true,
                      onChanged: (value) {
                        password = value;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        hintStyle: TextStyle(
                            color: Colors.grey
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  GestureDetector(
                    onTap: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                        if (user != null) {
                          Navigator.of(context).pushNamed(
                            '/tabScreen',
                          );
                        }
                        setState(() {
                          showSpinner = false;
                        });
                      }
                      catch(e) {
                        print(e);
                      }

                    },
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 60),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.pinkAccent
                      ),
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        '/signup',
                      );
                    },
                    child: Center(
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                            color: Colors.pink[200]
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}