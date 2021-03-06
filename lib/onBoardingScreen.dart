import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'main.dart';

class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return MaterialApp(
      title: 'Introduction screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: OnBoardingPage(),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key key}) : super(key: key);

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => MyHomePage()),
    );
  }


  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Welcome to PathPet",
          body:
          "Our main purpose is to increase the number of the food containers for stray animals and keep them full all the time.",
          image:Image.asset('assets/onBoarding-1.png', width: 350.0),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "How do I use the app?",
          body:
          "You can take a look at the food containers on the map and you can supplement the food for the nearest point.",
          image: Image.asset('assets/onBoarding-2.png', width: 350.0),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Add food to containers",
          body:
          "Decreases in the food container will appear on the map. You can add foods to containers",
          image: Image.asset('assets/onBoarding-3.png', width: 350.0),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Make animals happier!",
          body:
          "You just want to make street animals happy. Start to use!",
          image: Image.asset('assets/onBoarding-4.png', width: 350.0),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text("This is the screen after Introduction")),
    );
  }
}
