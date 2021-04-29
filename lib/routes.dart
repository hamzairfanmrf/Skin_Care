

import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:skin_care/just_check.dart';
import 'package:skin_care/main.dart';
import 'package:skin_care/splash_screen.dart';
import 'home_page.dart';
import 'package:skin_care/Login.dart';

final Map<String,WidgetBuilder> routes={

  home_page.routeName:(context)=>home_page(),
  just_check.routeName:(context) => just_check(),
  SplashScreen.routename:(context) => SplashScreen(),

};