import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List data;
  var totalCon = 0;
  var totalRec = 0;
  var totalDeath = 0;
  var totalAct = 0;
  var upCon = 0;
  var upAct = 0;
  var upRec = 0;
  var upDea = 0;

  void getData() async {
    Response response = await get('https://covid-su.herokuapp.com/');
    var collect = jsonDecode(response.body);

    for (var item in collect['data']) {
      totalCon += int.parse(item[5]);
      totalRec += int.parse(item[3]);
      totalDeath += int.parse(item[4]);
      totalAct += int.parse(item[2]);
    }

    upCon = int.parse(collect['data'][33][5]);
    upAct = int.parse(collect['data'][33][2]);
    upRec = int.parse(collect['data'][33][3]);
    upDea = int.parse(collect['data'][33][4]);

    setState(() {
      data = collect['data'];
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ayush Bharat'),
          centerTitle: true,
          backgroundColor: Colors.red[300],
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/india.jpg'),
                      maxRadius: 60.0,
                    ),
                    Text("Hello Terminator !!")
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                ),
              ),
              ListTile(
                title: Text('Settings'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Privacy'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: Column(children: <Widget>[
          Container(
              padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
              height: 240.0,
              color: Colors.redAccent,
              child: Column(
                children: <Widget>[
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    color: Colors.deepOrange[800],
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Total Cases In INDIA',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  'Confirmed',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                VerticalDivider(),
                                Text(
                                  'Active',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                VerticalDivider(),
                                Text(
                                  'Recovered',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                VerticalDivider(),
                                Text(
                                  'Death',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  '$totalCon',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                VerticalDivider(),
                                Text(
                                  '$totalAct',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                VerticalDivider(),
                                Text(
                                  '$totalRec',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                VerticalDivider(),
                                Text(
                                  '$totalDeath',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
                          Divider(
                            color: Colors.black,
                          ),
                          Text(
                            'Uttar Pradesh',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                'Confirmed',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              VerticalDivider(),
                              Text(
                                'Active',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              VerticalDivider(),
                              Text(
                                'Recovered',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              VerticalDivider(),
                              Text(
                                'Death',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                '$upCon',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              VerticalDivider(),
                              Text(
                                '$upAct',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              VerticalDivider(),
                              Text(
                                '$upRec',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              VerticalDivider(),
                              Text(
                                '$upDea',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                          flex: 2,
                          child: Text(
                            'State/UT',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                      Expanded(
                          flex: 1,
                          child: Text(
                            'Confirm',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                      Expanded(
                          flex: 1,
                          child: Text(
                            'Active',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                      Expanded(
                          flex: 1,
                          child: Text(
                            'Recover',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                      Expanded(
                          flex: 1,
                          child: Text(
                            'Death',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  )
                ],
              )),
          Flexible(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: ListView.builder(
                  itemCount: data == null ? 0 : data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: <Widget>[
                        Card(
                          elevation: 0,
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Expanded(flex: 2, child: Text(data[index][1])),
                              VerticalDivider(
                                color: Colors.black,
                                width: 40.0,
                              ),
                              Expanded(flex: 1, child: Text(data[index][5])),
                              VerticalDivider(
                                color: Colors.black,
                              ),
                              Expanded(flex: 1, child: Text(data[index][2])),
                              VerticalDivider(
                                color: Colors.black,
                              ),
                              Expanded(flex: 1, child: Text(data[index][3])),
                              VerticalDivider(
                                color: Colors.black,
                              ),
                              Expanded(flex: 1, child: Text(data[index][4])),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.black87,
                        )
                      ],
                    );
                  }),
            ),
          ),
        ]));
  }
}
