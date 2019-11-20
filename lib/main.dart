import 'package:flutter/material.dart';
import './mapspage.dart' as mapspage;
import './chartpage.dart' as chartpage;
import './profilepage.dart' as profilepage;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar: new AppBar(
      //   title: new Text('PetPath'),
      //   centerTitle: true,   ////////////
      //   backgroundColor: Colors.teal,
      // ),
      bottomNavigationBar: new Material(
          color: Colors.lightBlue,
          child: new TabBar(
            controller: controller,
            tabs: <Widget>[
            new Tab(icon: new Icon(Icons.map)),
            new Tab(icon: new Icon(Icons.insert_chart)),
                new Tab(icon: new Icon(Icons.person)),
          ],
          ) 
        ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new mapspage.MapsPage(),
          new chartpage.ChartPage(),
          new profilepage.ProfilePage(),
        ],
      )
    );
  }
}