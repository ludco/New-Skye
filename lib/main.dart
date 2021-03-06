import 'package:flutter/material.dart';
import './Oracle.dart' as first;
import './Horoscope.dart' as second;

void main() {
  runApp(new MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          backgroundColor: Colors.deepPurple,
          appBarTheme: AppBarTheme(centerTitle: true),
          textTheme: TextTheme(
            bodyText2: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          )),
      home: new MyTabs()));
}

class MyTabs extends StatefulWidget {
  @override
  MyTabsState createState() => new MyTabsState();
}

class MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {
  late TabController controller;
  String _title = '';

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 2);
    _title = "Oracle";
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          title: Text(
            _title,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.deepPurple,
        ),
        bottomNavigationBar: new Material(
            color: Colors.deepPurple,
            child: new TabBar(
                onTap: onTabTapped,
                controller: controller,
                tabs: <Tab>[
                  new Tab(
                      icon: new Icon(Icons.remove_red_eye_rounded),
                      text: 'Oracle'),
                  new Tab(
                      icon: new Icon(Icons.star_half_rounded),
                      text: 'Horoscope')
                ])),
        body: new TabBarView(controller: controller, children: <Widget>[
          new first.Orcale(),
          new second.Horoscope(),
        ]));
  }

  void onTabTapped(int index) {
    setState(() {
      switch (index) {
        case 0:
          {
            _title = 'Oracle';
          }
          break;
        case 1:
          {
            _title = 'Horsocope';
          }
          break;
      }
    });
  }
}
