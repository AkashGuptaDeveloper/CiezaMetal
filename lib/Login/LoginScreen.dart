import 'dart:async';
import 'package:ciezametal/Signup/SignupScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ciezametal/Colors/Color.dart';
import 'package:ciezametal/GlobalString.dart';
import 'package:ciezametal/Login/FadeAnimation.dart';
import 'package:ciezametal/Login/widgets/responsive_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ciezametal/Home/Homescreen.dart';
//----------------------------------------------------------------------------------------------//
class LoginScreen extends StatefulWidget {
  static String tag = 'LoginScreen';
  @override
  LoginScreenState createState() => new LoginScreenState();
}
//----------------------------------------------------------------------------------------------//
class LoginScreenState extends State<LoginScreen> {
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  ScrollController _scrollController = new ScrollController();
  TextEditingController LoginEmailController = new TextEditingController();
  TextEditingController LoginPasswordController = new TextEditingController();
  final FocusNode myFocusNodeEmail = FocusNode();
  final FocusNode myFocusNodePassword = FocusNode();
  String _email, _password;
  String status = '';
  var data;
  var ReciveUserID="";
  var ReciveUserFirstName ="";
  var ReciveUserLastName ="";
  var ReciveUserEmail ="";
  var ReciveUserFullName ="";
  GlobalKey<FormState> _key = new GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _validate = false;
//----------------------------------------------------------------------------------------------//
  @override
  void initState() {
    super.initState();
  }
//----------------------------------------------------------------------------------------------//
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large =  ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium =  ResponsiveWidget.isScreenMedium(_width, _pixelRatio);

//-----------------------------------------------------------------------------------//
    return new WillPopScope(
      onWillPop: () async {
        Future.value(
            false); //return a `Future` with false value so this route cant be popped or closed.
      },
      child: new Scaffold(
        key: _scaffoldKey,
        body: new Container(
          height: _height,
          width: _width,
          margin: EdgeInsets.only(bottom: 5),
          child: SingleChildScrollView(
            child: new Form(
              key: _key,
              autovalidate: _validate,
              child: Column(
                children: <Widget>[
                  FormUI(),
                  SizedBox(height: 15.0,),
                  FormTextField(),
                  SizedBox(height: 15.0,),
                  FormBtnLoginSignup(),
                  SizedBox(height: 20.0,),
                  //FormForgotPassword(),
                ],
                ),
              ),
            ),
          ),
        ),
      );
  }
//----------------------------------------------------------------------------------------------//
  Widget FormUI() {
    return new Column(
      children: <Widget>[
        new Container(
          child: new ListView(
            padding: EdgeInsets.only(left: 0.0, right: 0.0),
            shrinkWrap: true,
            children: <Widget>[
              SizedBox(
                height: 10.0,
                ),
//------------------------------------------------------------------------------------------------------------//
              new Container(
                height: 300,
                color: ColorCode.AppColorCode,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 30,
                      width: 80,
                      height: 200,
                      child: FadeAnimation(1, Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(GlobalString.Imagetlight1)
                                )
                            ),
                        )),
                      ),
                    Positioned(
                      left: 140,
                      width: 80,
                      height: 150,
                      child: FadeAnimation(1.3, Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(GlobalString.Imagetlight2)
                                )
                            ),
                        )),
                      ),
                    Positioned(
                      right: 40,
                      top: 40,
                      width: 80,
                      height: 150,
                      child: FadeAnimation(1.5, Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(GlobalString.ImagetClock)
                                )
                            ),
                        )),
                      ),
                    Positioned(
                      child: FadeAnimation(1.6, Container(
                        margin: EdgeInsets.only(top: 150),
                        child: Center(
                          child: FadeAnimation(1.3, Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(GlobalString.ImagetSplashScreenLogo)
                                    )
                                ),
                            ),),
                          ),
                        )),
                      ),
                  ],
                  ),
                ),
            ],
            ),
          ),
      ],
      );
  }
//------------------------------------------------------------------------------------------------------------//
  Widget FormTextField() {
    return new Column(
      children: <Widget>[
        new FadeAnimation(2, Container(
          child: new ListView(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            controller: _scrollController,
            shrinkWrap: true,
            children: <Widget>[
              SizedBox(
                height: 10.0,
                ),
//------------------------------------------------------------------------------------------------------------//
              new TextFormField(
                focusNode: myFocusNodeEmail,
                controller: LoginEmailController,
                validator: validateEmail,
                onSaved: (String val) {
                  _email = val;
                },
                decoration: new InputDecoration(
                  border: new OutlineInputBorder(),
                  hintText: 'Enter EmailID',hintStyle: TextStyle(fontSize: 12.0, color:ColorCode.AppColorCode),
                  labelText: 'EmailID',labelStyle:
                new TextStyle(fontSize: 14.0, color:ColorCode.AppColorCode,fontWeight: FontWeight.w300),
                  prefixIcon: const Icon(Icons.email,  color:Color(0xFF000000),),
                  prefixText: ' ',
                  ),
                ),
              SizedBox(height: 10.0),
//------------------------------------------------------------------------------------------------------------//
              new TextFormField(
                autocorrect: false,
                obscureText: true,
                focusNode: myFocusNodePassword,
                controller: LoginPasswordController,
                validator: (value) =>
                value.isEmpty ? "Password should be at least 6 characters" : null,
                onSaved: (val) => _password = val,
                decoration: new InputDecoration(
                  border: new OutlineInputBorder(),
                  hintText: 'Enter Password',hintStyle: TextStyle(fontSize: 12.0, color:ColorCode.AppColorCode),
                  labelText: 'Password',labelStyle:
                new TextStyle(fontSize: 14.0, color:ColorCode.AppColorCode,fontWeight: FontWeight.w300),
                  prefixIcon: const Icon(Icons.lock,  color:Color(0xFF000000),),
                  prefixText: ' ',
                  ),
                ),
            ],
            ),
          ),
                          ),
      ],
      );
  }
//--------------------------------------------------------------------------------------------------------------------------------//
  Widget FormBtnLoginSignup() {
    return  FadeAnimation(2, Container(
        margin: EdgeInsets.only(left: 20.0,right: 20.0),
        child: Row(children: <Widget>[
          Expanded(
            child: new FlatButton.icon(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: ColorCode.AppColorCode)),
              color: ColorCode.AppColorCode,
              icon: Icon(FontAwesomeIcons.signOutAlt,color: Colors.white,size: 18.0,), //`Icon` to display
              label: Text(GlobalString.Login.toUpperCase(),style: TextStyle(fontSize: 15.0, color: Colors.white,fontWeight: FontWeight.bold,)), //`Text` to display
              onPressed: () {
                _sendToServer();
              },
              ),
            ),
          new Container(
            color: ColorCode.TextColorCode,
            height: 50.0,
            width: 1.0,
            ),
          Expanded(
            child: new FlatButton.icon(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: ColorCode.AppColorCode)),
              color: ColorCode.AppColorCode,
              icon: Icon(FontAwesomeIcons.userPlus,color: Colors.white,size: 18.0,), //`Icon` to display
              label: Text(GlobalString.Signup.toUpperCase(),style: TextStyle(fontSize: 15.0, color: Colors.white,fontWeight: FontWeight.bold,)), //`Text` to display
              onPressed: () => Navigator.of(context).pushNamed(SignupScreen.tag),
              ),
            ),
        ])
        ),
                          );
  }
//-----------------------------------------------------------------------------------------------------------------------------------------//
  String validateEmail(String value) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if(!regExp.hasMatch(value)){
      return "Invalid Email";
    }else {
      return null;
    }
  }
//------------------------------------------------------------------------------------------------------------//
  _sendToServer() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      _displaySnackbar(context);
      signIn();
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }
  }
  //-----------------------------------------------------------------------------------------------------------------------------------------//
  void signIn() async {
    try{
      FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen(user: user)));
    }catch(e){
      print(e.message);
    }
  }
//----------------------------------------------------------------------------------------------//
  void  _displaySnackbar(BuildContext context) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      duration: Duration(minutes: 10),
      content: Text(GlobalString.PleaseWait,style: TextStyle(color: ColorCode.TextColorCode),),
      backgroundColor: ColorCode.AppColorCode,
      ));
  }
}
//----------------------------------------------------------------------------------------------//