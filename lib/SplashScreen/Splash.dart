import 'dart:async';
import 'package:ciezametal/Colors/Color.dart';
import 'package:ciezametal/Login/LoginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Palette {
  static Color greenLandLight = Color(0xFF2EADF0);
}
class Splash extends StatefulWidget {
  static String tag = 'Splash';
  @override
  SplashState createState() => new SplashState();
}

class SplashState extends State<Splash>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  AnimationController animationController;
  Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 4);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator
        .of(context)
        .push(new MaterialPageRoute(builder: (_) => new LoginScreen()));
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 4),
    );
    animation =
    new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:ColorCode.TextColorCodeBlue,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              /*Padding(
                padding: EdgeInsets.only(bottom: 30.0),
                child: new Text(
                  'Copyright © 2019 DealSezy',style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600,color: Colors.white),
                ),
              )*/
            ],
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                'assets/images/logo.jpg',
                width: animation.value * 250,
                height: animation.value * 250,
              ),
            ],
          ),
        ],
      ),
    );
  }
}