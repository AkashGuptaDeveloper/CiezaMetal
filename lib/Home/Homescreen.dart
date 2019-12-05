import 'dart:async';
import 'dart:convert';
import 'package:ciezametal/SplashScreen/Splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ciezametal/Colors/Color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ciezametal/Colors/Color.dart';
import 'package:ciezametal/GlobalString.dart';
//-------------------------------------------------------------------------------------------------//
class Homescreen extends StatefulWidget {
  static String tag = 'Homescreen';
  const Homescreen({Key key, this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  _HomescreenState createState() => new _HomescreenState();
}

class _HomescreenState extends State<Homescreen>{


  @override
  void initState() {
  }

  @override
  Widget build(BuildContext context) {


    final list = new Padding(
      padding: const EdgeInsets.only(bottom:2.0),
      child: new GestureDetector(
        onTap: () {
          //Navigator.of(context).pushNamed(StudentDetail.tag);
        },
        child: new Card(
          color: Colors.white,
          child: new Column(
            children: <Widget>[
              new ListTile(
                leading: Image.asset(
                  'assets/images/logo.jpg',
                  height: 250.0,
                  width: 50.0,
                  ),

                title: new Text(
                  "Roberth".toUpperCase(),textAlign: TextAlign.start,
                  style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,color: ColorCode.TextColorCodeBlue),
                  ),
                trailing: Icon(Icons.keyboard_arrow_right,color: ColorCode.TextColorCodeBlue,),
                subtitle: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text('01-10-2019',
                                   style: new TextStyle(
                                       fontSize: 13.0, fontWeight: FontWeight.normal,color: ColorCode.TextColorCodeBlue)),
                    ]),
                )
            ],
            ),
          ),
        ),
      );
    final GlobalKey<ScaffoldState> _scaffoldKey =
    new GlobalKey<ScaffoldState>();

    return new WillPopScope(
      onWillPop: () async {
        Future.value(
            false); //return a `Future` with false value so this route cant be popped or closed.
      },
      child: Scaffold(
        drawer: _drawer(),
        appBar: new AppBar(
          title: Text("Home".toUpperCase(),style: TextStyle(
              fontSize: 15.0, color: Colors.white,fontWeight: FontWeight.bold),),
          iconTheme: new IconThemeData(color: Colors.white),
          centerTitle: true,
          actions: <Widget>[
            new IconButton(
              padding: new EdgeInsets.all(15.0),
              icon: new Icon(
                Icons.notifications,
                color: Colors.white,
                ),
              onPressed: null,
              ),
          ],
          ),

        body: new ListView(
          children: [
            list,
            list,
            list,
            list,
            list,
            list,
            list,
            list,
            list,
            list,
            list,
            list,
            list,
            list,
            list,
            list,
            list,
            list,
            list,
            list,
            list,
            list,
            list,
            list,
            list,
          ],
          ),

        ),
      );

  }
  Widget _drawer() {
    return new Drawer(
        elevation: 20.0,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(

              accountName: Text("Mr. "+"Roberth".toUpperCase(),style: TextStyle(
                  fontSize: 16.0,
                  color: ColorCode.TextColorCode,
                  letterSpacing: 1.4,
                  backgroundColor: Colors.transparent,
                  fontWeight: FontWeight.bold),),
              accountEmail: Text("Roberth.akash@gmail.com",style: TextStyle(
                  fontSize: 16.0,
                  color: ColorCode.TextColorCode,
                  letterSpacing: 1.4,
                  backgroundColor: Colors.transparent,
                  fontWeight: FontWeight.bold),),
              currentAccountPicture:
              CircleAvatar(
                backgroundImage: ExactAssetImage('assets/images/logo.jpg'),
                minRadius: 90,
                maxRadius: 100,
                ),
              decoration: BoxDecoration(color: ColorCode.AppColorCode),
              ),
            ListTile(
              leading: new Image.asset(
                'assets/images/home.png',
                width: 20.0,
                height: 20.0,
                fit: BoxFit.cover,
                ),
              title: Text("Home".toUpperCase(),style: TextStyle( fontSize: 15.0, color: ColorCode.TextColorCodeBlue,fontWeight: FontWeight.bold),),
              onTap: () {
                //Navigator.of(context).pushNamed(HomeScreen.tag);
              },
              ),
            Divider(
              height: 2.0,
              ),
            ListTile(
              leading: new Image.asset(
                'assets/images/friend.png',
                width: 20.0,
                height: 20.0,
                fit: BoxFit.cover,
                ),
              title: Text("Friend".toUpperCase(),style: TextStyle( fontSize: 15.0, color: ColorCode.TextColorCodeBlue,fontWeight: FontWeight.bold),),
              onTap: () {
                //Navigator.of(context).pushNamed(Profile.tag);
              },
              ),
            Divider(
              height: 2.0,
              ),
            ListTile(
              leading: new Image.asset(
                'assets/images/faq.png',
                width: 20.0,
                height: 20.0,
                fit: BoxFit.cover,
                ),
              title: Text("Faq".toUpperCase(),style: TextStyle( fontSize: 15.0, color: ColorCode.TextColorCodeBlue,fontWeight: FontWeight.bold),),
              onTap: () {
                // Navigator.of(context).pushNamed(Product.tag);
              },
              ),
            Divider(
              height: 2.0,
              ),
            ListTile(
              leading: new Image.asset(
                'assets/images/about.png',
                width: 20.0,
                height: 20.0,
                fit: BoxFit.cover,
                ),
              title: Text("About".toUpperCase(),style: TextStyle( fontSize: 15.0, color: ColorCode.TextColorCodeBlue,fontWeight: FontWeight.bold),),
              onTap: () {
                // Navigator.of(context).pushNamed(AboutUsScreen.tag);
              },
              ),
            Divider(
              height: 2.0,
              ),
            ListTile(
              leading: new Image.asset(
                'assets/images/term.png',
                width: 20.0,
                height: 20.0,
                fit: BoxFit.cover,
                ),
              title: Text("Terms".toUpperCase(),style: TextStyle( fontSize: 15.0, color: ColorCode.TextColorCodeBlue,fontWeight: FontWeight.bold),),
              onTap: () {
                // Navigator.of(context).pushNamed(TermAndCondition.tag);
              },
              ),
            Divider(
              height: 2.0,
              ),
            ListTile(
              leading: new Image.asset(
                'assets/images/logout.png',
                width: 20.0,
                height: 20.0,
                fit: BoxFit.cover,
                ),
              title: Text("logout".toUpperCase(),style: TextStyle( fontSize: 15.0, color: ColorCode.TextColorCodeBlue,fontWeight: FontWeight.bold),),
              onTap: () {
                TapMessage(context, "Logout!");
              },
              ),
            Divider(
              height: 2.0,
              ),
          ],
          ));
  }
//--------------------------------------------------------------------------------------------------//
//------------------------------------------AlertDilogTapMessage------------------------------------//
  Future<void> TapMessage(BuildContext context, String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(message, textAlign: TextAlign.center, style: new TextStyle(fontSize: 15.0, color: ColorCode.AppColorCode, fontWeight: FontWeight.bold),),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(GlobalString.LogOut.toString(), textAlign: TextAlign.center, style: new TextStyle(fontSize: 12.0, color: ColorCode.TextColorCodeBlue, fontWeight: FontWeight.bold),),
              ],
              ),
            ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(GlobalString.cancel, style: new TextStyle(fontSize: 15.0, color: ColorCode.TextColorCodeBlue, fontWeight: FontWeight.bold),),
              ),
            FlatButton(
              onPressed: () {
                removeData(context);
              },
              child: Text(GlobalString.ok, style: new TextStyle(fontSize: 15.0, color: ColorCode.TextColorCodeBlue, fontWeight: FontWeight.bold),),
              ),
          ],
          );
      },
      );
  }
//---------------------------------------------------------------------------------------------------//
  removeData(BuildContext context) async {
    Navigator.of(context).pushNamed(Splash.tag);
  }
}
