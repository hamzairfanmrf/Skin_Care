import 'dart:async';

import 'package:flutter/material.dart';
import 'package:skin_care/API/api.dart';

import 'package:skin_care/main.dart';

import 'Home.dart';
import 'displayUsingAPI/below_buttons.dart';


class SplashScreen extends StatefulWidget {
  static String routename='/Splash_screen';
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  var a=APi.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    a.Orders_List(context);
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/skin_food.jpeg'), fit: BoxFit.contain),
          color: Colors.white),
    );
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => MyHomePage()));
  }
}