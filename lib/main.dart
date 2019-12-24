import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';
import './mapspage.dart' as mapspage;
import './chartpage.dart' as chartpage; 
import './login_page.dart' as loginpage;
import './onBoardingScreen.dart' as onboarding;
import 'auth.dart';
import 'home_page.dart';

//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'dart:async';



void main() => runApp(
      ChangeNotifierProvider<AuthService>(
        child: MyApp(),
        builder: (BuildContext context) {
          return AuthService();
        },
      ),
    );

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FutureBuilder<FirebaseUser>(
        future: Provider.of<AuthService>(context).getUser(),
        builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // log error to console 
            if (snapshot.error != null) { 
              print("error");
              return Text(snapshot.error.toString());
            }

            // redirect to the proper page
            return snapshot.hasData ? HomePage(snapshot.data) : onboarding.OnBoarding();
          } else {
            // show loading indicator
            return LoadingCircle();
          }
        },
      ),
    );
  }
}



class LoadingCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: CircularProgressIndicator(),
        alignment: Alignment(0.0, 0.0),
      ),
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
  bool _requireConsent = true;


  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 3);
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    OneSignal.shared.init(
        "ecd56500-fc94-4ca1-8d9e-56cee7534b8f",
        iOSSettings: {
          OSiOSSettings.autoPrompt: false,
          OSiOSSettings.inAppLaunchUrl: true
        }
    );
    OneSignal.shared.setInFocusDisplayType(OSNotificationDisplayType.notification);
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
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: <Widget>[
          new mapspage.MapsPage(),
          new chartpage.ChartPage(),
          new loginpage.LoginPage(),
        ],
      )
    );
  }
}