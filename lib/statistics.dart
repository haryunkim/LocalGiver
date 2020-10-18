import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Payment {
  final String month;
  final int cost;

  Payment(this.month, this.cost);
}

class Sales {
  final int month;
  final int cost;

  Sales(this.month, this.cost);
}

class Statistics extends StatefulWidget {
  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  PageController _pageController;
  List<charts.Series<Payment, String>> seriesList;
  List<charts.Series<Payment, String>> seriesList2;
  List<charts.Series<Sales, int>> lineData;
  List<charts.Series<Payment, String>> lineData2;

  final data = [
    Payment("05", 16),
    Payment("06", 38),
    Payment("07", 36),
    Payment("08", 41),
    Payment("09", 24),
  ];
  final data2 = [
    Payment("05", 24),
    Payment("06", 34),
    Payment("07", 38),
    Payment("08", 23),
    Payment("09", 28),
  ];
  final salesData = [
    Sales(0, 16),
    Sales(1, 38),
    Sales(2, 36),
    Sales(3, 41),
    Sales(4, 24),
  ];

  final salesData2 = [
    Sales(0, 24),
    Sales(1, 34),
    Sales(2, 38),
    Sales(3, 23),
    Sales(4, 48),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 0.9);
    seriesList = [
      charts.Series<Payment, String>(id: "cost", domainFn: (v, _) => v.month, measureFn: (v, _) => v.cost, data: data),
    ];
    seriesList2 = [
      charts.Series<Payment, String>(id: "cost", domainFn: (v, _) => v.month, measureFn: (v, _) => v.cost, data: data2),
    ];
    lineData = [
      charts.Series<Sales, int>(id: "1", domainFn: (p, _) => p.month, measureFn: (p, _) => p.cost, data: salesData),
      charts.Series<Sales, int>(id: "2", domainFn: (p, _) => p.month, measureFn: (p, _) => p.cost, data: salesData2)
    ];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2.1,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "My Projects",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.tune,
                              color: Colors.grey,
                              size: 18,
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 9,
                      child: PageView(
                        controller: _pageController,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Card(
                              elevation: 10,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 34,
                                            width: 34,
                                            decoration: BoxDecoration(
                                                color: Colors.orange, borderRadius: BorderRadius.circular(8)),
                                            child: Center(
                                              child: Text(
                                                "SB",
                                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Small Business 1",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 12),
                                                ),
                                                Text(
                                                  "001 - Danny Kim",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold, color: Colors.black, fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Spacer(),
                                          IconButton(
                                            icon: Icon(Icons.timer),
                                            onPressed: () {},
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: seriesList != null
                                        ? charts.BarChart(
                                      seriesList,
                                      animate: false,
                                    )
                                        : Center(child: CircularProgressIndicator()),
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                                            Text(
                                              "TOTAL".toUpperCase(),
                                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                            ),
                                            Text(
                                              "\$2020",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
                                            )
                                          ]),
                                        ),
                                        Expanded(
                                          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                                            Text(
                                              "REMAINING".toUpperCase(),
                                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                            ),
                                            Text(
                                              "\$2980",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
                                            )
                                          ]),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 32,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                color: Colors.red[100], borderRadius: BorderRadius.circular(8)),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.calendar_today,
                                                  size: 16,
                                                  color: Colors.red,
                                                ),
                                                Text(
                                                  "23 DAYS LEFT",
                                                  style: TextStyle(
                                                      color: Colors.red, fontWeight: FontWeight.bold, fontSize: 12),
                                                )
                                              ],
                                            ),
                                          ),
                                          Spacer(),
                                          CircleAvatar(),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("+1"),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Card(
                              elevation: 10,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 34,
                                            width: 34,
                                            decoration: BoxDecoration(
                                                color: Colors.orange, borderRadius: BorderRadius.circular(8)),
                                            child: Center(
                                              child: Text(
                                                "SB",
                                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Small Business 2",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 12),
                                                ),
                                                Text(
                                                  "002 - Branden Chong",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold, color: Colors.black, fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Spacer(),
                                          IconButton(
                                            icon: Icon(Icons.timer),
                                            onPressed: () {},
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: seriesList2 != null
                                        ? charts.BarChart(
                                      seriesList2,
                                      animate: false,

                                    )
                                        : Center(child: CircularProgressIndicator()),
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                                            Text(
                                              "Total".toUpperCase(),
                                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                            ),
                                            Text(
                                              "\$2020",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
                                            )
                                          ]),
                                        ),
                                        Expanded(
                                          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                                            Text(
                                              "REMAINING".toUpperCase(),
                                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                            ),
                                            Text(
                                              "\$2980",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
                                            )
                                          ]),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 32,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                color: Colors.red[100], borderRadius: BorderRadius.circular(8)),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.calendar_today,
                                                  size: 16,
                                                  color: Colors.red,
                                                ),
                                                Text(
                                                  "23 DAYS LEFT",
                                                  style: TextStyle(
                                                      color: Colors.red, fontWeight: FontWeight.bold, fontSize: 12),
                                                )
                                              ],
                                            ),
                                          ),
                                          Spacer(),
                                          CircleAvatar(),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("+1"),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Card(
                              elevation: 10,
                              child: Column(),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1.5,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Earnings",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.tune,
                              color: Colors.grey,
                              size: 18,
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 9,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Card(
                          elevation: 12,
                          color: Colors.white,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 34,
                                      decoration: BoxDecoration(),
                                      child: Center(
                                        child: Text("WEEKLY"),
                                      ),
                                    ),
                                    Container(
                                      width: 100,
                                      height: 34,
                                      decoration:
                                      BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(4)),
                                      child: Center(
                                        child: Text(
                                          "MONTHLY",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 100,
                                      height: 34,
                                      decoration: BoxDecoration(),
                                      child: Center(
                                        child: Text("YEARLY"),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: lineData != null
                                    ? charts.LineChart(
                                  lineData,
                                  defaultRenderer: charts.LineRendererConfig(includeArea: true, stacked: true),
                                  animate: true,
                                )
                                    : Center(child: CircularProgressIndicator()),
                              ),
                              Expanded(
                                flex: 2,
                                child: ListView.separated(
                                  itemCount: salesData.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                        height: 38,
                                        padding: EdgeInsets.symmetric(horizontal: 16),
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 8,
                                              child: CircleAvatar(
                                                radius: 4,
                                                backgroundColor: Colors.white,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text("Anonymous"),
                                            ),
                                            Spacer(),
                                            Text("\$ ${salesData[index].cost}")
                                          ],
                                        ));
                                  },
                                  separatorBuilder: (context, index) {
                                    return Divider(
                                      height: 2,
                                      color: Colors.grey,
                                      thickness: 2,
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
//      floatingActionButton: FloatingActionButton(
//        mini: true,
//        backgroundColor: Colors.black,
//        onPressed: () {},
//        child: Icon(Icons.search),
//      ),
//      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//      bottomNavigationBar: BottomNavigationBar(
//        currentIndex: _pageIndex,
//        onTap: (index) {
//          setState(() {
//            _pageIndex = index;
//          });
//        },
//        type: BottomNavigationBarType.fixed,
//        items: [
//          BottomNavigationBarItem(
//              icon: Icon(
//                Icons.dashboard,
//              ),
//              title: Text("Dashboard")),
//          BottomNavigationBarItem(
//              icon: Icon(
//                Icons.credit_card,
//              ),
//              title: Text("Projects")),
//          BottomNavigationBarItem(
//              icon: Icon(
//                Icons.insert_chart,
//              ),
//              title: Text("Statistics")),
//          BottomNavigationBarItem(
//              icon: Icon(
//                Icons.mail,
//              ),
//              title: Text("Inbox")),
//        ],
//      ),
    );
  }
}