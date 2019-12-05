import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ciezametal/Colors/Color.dart';
import 'package:ciezametal/GlobalString.dart';
import 'package:ciezametal/Login/FadeAnimation.dart';
import 'package:ciezametal/Login/LoginScreen.dart';
import 'package:ciezametal/Login/widgets/responsive_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
//----------------------------------------------------------------------------------------------//
class SignupScreen extends StatefulWidget {
  static String tag = 'SignupScreen';
  @override
  SignupScreenState createState() => new SignupScreenState();
}
//----------------------------------------------------------------------------------------------//
class SignupScreenState extends State<SignupScreen> {
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  ScrollController _scrollController = new ScrollController();
  TextEditingController SignupFirstNameController = new TextEditingController();
  TextEditingController SignupLastNameController = new TextEditingController();
  TextEditingController SignupMobileNumberController = new TextEditingController();
  TextEditingController SignupEmailController = new TextEditingController();
  TextEditingController SignupPasswordController = new TextEditingController();
  final FocusNode myFocusNodeFirstName = FocusNode();
  final FocusNode myFocusNodeLastName = FocusNode();
  final FocusNode myFocusNodeMobileNumber = FocusNode();
  final FocusNode myFocusNodeEmail = FocusNode();
  final FocusNode myFocusNodePassword = FocusNode();
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String _email, _password;
  var loading = true;
  String status = '';
  var data;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//----------------------------------------------------------------------------------------------//
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large =  ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium =  ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
//-------------------------------------------------------------------------------//
    return  Scaffold(
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
                FormBtnSignup(),
              ],
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
                controller: SignupEmailController,
                validator: validateEmail,
                onSaved: (String val) {
                  _email = val;
                },
                decoration: new InputDecoration(
                  border: new OutlineInputBorder(),
                  hintText: 'Enter Email',hintStyle: TextStyle(fontSize: 12.0, color:ColorCode.AppColorCode),
                  //helperText: 'Keep it short, this is just a demo.',
                  labelText: 'Email Address',labelStyle:
                new TextStyle(fontSize: 14.0, color:ColorCode.AppColorCode,fontWeight: FontWeight.w300),
                  prefixIcon: const Icon(Icons.email,  color:Color(0xFF000000),),
                  prefixText: ' ',
                  //suffixText: 'USD',
                  //suffixStyle: const TextStyle(color: Colors.green)
                  ),
                ),
              SizedBox(height: 10.0),
//------------------------------------------------------------------------------------------------------------//
              new TextFormField(
                autocorrect: false,
                obscureText: true,
                focusNode: myFocusNodePassword,
                controller: SignupPasswordController,
                validator: (value) =>
                value.isEmpty ? "Password should be at least 6 characters" : null,
                onSaved: (val) => _password = val,
                decoration: new InputDecoration(
                  border: new OutlineInputBorder(),
                  hintText: 'Enter Password',hintStyle: TextStyle(fontSize: 12.0, color:ColorCode.AppColorCode),
                  //helperText: 'Keep it short, this is just a demo.',
                  labelText: 'Password',labelStyle:
                new TextStyle(fontSize: 14.0, color:ColorCode.AppColorCode,fontWeight: FontWeight.w300),
                  prefixIcon: const Icon(Icons.lock,  color:Color(0xFF000000),),
                  prefixText: ' ',
                  //suffixText: 'USD',
                  //suffixStyle: const TextStyle(color: Colors.green)
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
  Widget FormBtnSignup() {
    return  FadeAnimation(2, Container(
        margin: EdgeInsets.only(left: 20.0,right: 20.0),
        child: Row(children: <Widget>[
          Expanded(
            child: new FlatButton.icon(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: ColorCode.AppColorCode)),
              color: ColorCode.AppColorCode,
              icon: Icon(FontAwesomeIcons.registered,color: Colors.white,size: 18.0,), //`Icon` to display
              label: Text(GlobalString.Signup.toUpperCase(),style: TextStyle(fontSize: 15.0, color: Colors.white,fontWeight: FontWeight.bold,)), //`Text` to display
              onPressed: () {
                _sendToServer();
              },
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
//-------------------------------------------------------------------------------------------------------------------//
  void signUp() async {
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
      _SignUpAlert(context);
    }catch(e){
      print(e.message);
    }
  }
//-------------------------------------------------------------------------------------------------------------------//
  _sendToServer() async {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      print("true");
      _displaySnackbar(context);
      signUp();
    } else {
      setState(() {
        print("Faield");
        _validate = true;
      });
    }
  }
//----------------------------------------------------------------------------------------------//
  void  _displaySnackbar(BuildContext context) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      duration: Duration(seconds: 1),
      content: Text(GlobalString.PleaseWait,style: TextStyle(color: ColorCode.TextColorCode),),
      backgroundColor: ColorCode.AppColorCode,
      ));
  }
//-------------------------------------------------------------------------------------------------------------//
  Future<void> _SignUpAlert(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(GlobalString.Message, textAlign: TextAlign.center, style: new TextStyle(fontSize: 15.0, color: ColorCode.TextColorCodeBlue, fontWeight: FontWeight.bold),),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(GlobalString.UserSignUp.toString(), textAlign: TextAlign.center, style: new TextStyle(fontSize: 12.0, color: ColorCode.TextColorCodeBlue, fontWeight: FontWeight.bold),),
              ],
              ),
            ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Text(GlobalString.ok, style: new TextStyle(fontSize: 15.0, color: ColorCode.TextColorCodeBlue, fontWeight: FontWeight.bold),),
              ),
          ],
          );
      },
      );
  }
}
//----------------------------------------------------------------------------------------------//