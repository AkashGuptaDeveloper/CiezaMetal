import 'package:ciezametal/Home/Homescreen.dart';
import 'package:ciezametal/Signup/SignupScreen.dart';
import 'package:flutter/material.dart';
import 'package:ciezametal/SplashScreen/Splash.dart';
import 'package:ciezametal/Login/LoginScreen.dart';

final routes = {
  '/Splash': (BuildContext context) => new Splash(),
  '/': (BuildContext context) => new Splash(),
  Splash.tag: (context) => Splash(),
  LoginScreen.tag: (context) => LoginScreen(),
  SignupScreen.tag: (context) => SignupScreen(),
  Homescreen.tag: (context) => Homescreen(),
};
