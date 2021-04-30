

import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:skin_care/Home.dart';
import 'package:skin_care/main.dart';
import 'package:skin_care/splash_screen.dart';

import 'package:skin_care/Login.dart';

final Map<String,WidgetBuilder> routes={


  just_check.routeName:(context) => just_check(),
  SplashScreen.routename:(context) => SplashScreen(),

};