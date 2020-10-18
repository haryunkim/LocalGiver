import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  TextEditingController _textEditingController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: <Widget>[
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Thank you for helping!",
                style: TextStyle(
                  fontSize: 29,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("From"),
                      Text("Enter amount"),
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(),
                      SizedBox(
                        width: 8,
                      ),
                      Text("USD"),
                      IconButton(icon: Icon(Icons.keyboard_arrow_down), onPressed: () {}),
                      Spacer(),
                      Expanded(
                          child: TextField(
                            controller: _textEditingController2,
                            textAlign: TextAlign.end,
                            style: TextStyle(fontSize: 24),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 120),
              decoration: BoxDecoration(color: Colors.pinkAccent, borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Text(
                  "Send money",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      );
  }
}
