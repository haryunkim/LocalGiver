import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'statistics.dart';
import 'projects.dart';
import 'inbox.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  final List<Widget> _pages = [
    Dashboard(),
    Projects(),
    Statistics(),
    Inbox(),
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex],
      floatingActionButton: FloatingActionButton(
        mini: true,
        backgroundColor: Colors.black,
        onPressed: () {},
        child: Icon(Icons.search),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard,
              ),
              title: Text("Dashboard")),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.credit_card,
              ),
              title: Text("Projects")),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.insert_chart,
              ),
              title: Text("Statistics")),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.mail,
              ),
              title: Text("Inbox")),
        ],
      ),
    );
  }
}
