import 'package:flutter/material.dart';

class Category {
  String title;
  bool isSelected;

  Category(this.title, this.isSelected);
}

class Projects extends StatefulWidget {
  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  List<String> _tabList = ["AR Games", "Adventure", "Sports", "Arcade"];
  List<Category> _tabListV2 = [
    Category("Restaurants", true),
    Category("Health", false),
    Category("Tech", false),
    Category("Music", false),
  ];
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
                child: Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.indigo[50],
                          borderRadius: BorderRadius.circular(24),
                        ),
                        padding: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 8,
                              child: TextField(
                                style: TextStyle(fontSize: 16),
                                decoration: InputDecoration(border: InputBorder.none),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: CircleAvatar(
                                backgroundColor: Colors.blue,
                                child: Icon(Icons.search),
                                foregroundColor: Colors.white,
                              ),
                            ),
                            Expanded(
                              child: CircleAvatar(
                                child: Icon(Icons.add),
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.pinkAccent,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, top: 16),
                height: MediaQuery.of(context).size.height / 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Featured",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Row(
                        children: [

                          Expanded(
                            flex: 9,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/payment');
                                },
                                  child: Container(
                                    margin: EdgeInsets.all(8),
                                    width: MediaQuery.of(context).size.width / 1.8,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(16),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://images.unsplash.com/photo-1586129658825-b19e41ad65af?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80"),
                                            fit: BoxFit.cover)),
                                    padding: EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Spacer(),
                                        Text(
                                          "Small Business 1",
                                          style: TextStyle(fontSize: 24, color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(8),
                                  width: MediaQuery.of(context).size.width / 1.8,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(16),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://images.unsplash.com/photo-1586129658825-b19e41ad65af?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80"),
                                          fit: BoxFit.cover)),
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Spacer(),
                                      Text(
                                        "Small Business 2",
                                        style: TextStyle(fontSize: 24, color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 48,
                decoration: BoxDecoration(),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _tabListV2.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: GestureDetector(
                        onTap: () {
                          _tabListV2[_tabIndex].isSelected = false;
                          setState(() {
                            _tabListV2[index].isSelected = true;
                            _tabIndex = index;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            border: _tabListV2[index].isSelected ? Border.all(color: Colors.pinkAccent, width: 2) : null,
                          ),
                          child: Center(
                            child: Text(
                              _tabListV2[index].title,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: _tabListV2[index].isSelected ? FontWeight.bold : FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Container(
                  margin: EdgeInsets.only(left: 16, top: 16),
                  height: MediaQuery.of(context).size.height / 4,

                  child: ListView.builder(
                    itemCount: 9,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(right: 16),
                        width: MediaQuery.of(context).size.width / 2.8,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://images.unsplash.com/photo-1586129658825-b19e41ad65af?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80"),
                                fit: BoxFit.cover)),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
