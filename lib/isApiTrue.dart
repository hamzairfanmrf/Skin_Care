import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:skin_care/api.dart';
import 'package:skin_care/categories.dart';
import 'package:skin_care/check_categeories.dart';
import 'api.dart';

class ApiTrue extends StatefulWidget {
  @override
  _ApiTrueState createState() => _ApiTrueState();
}


class _ApiTrueState extends State<ApiTrue> {

  String authKey='kt5OMQXn4LktxViHZnGR2uR5jqUBlmH2rpS8AS6cPf9Pz57yZ0DNm34kJcnAwqaJ';
  void getdata() async{
    http.Response response=await http.get('https://www.essentialkonjacskinfoods.com/Home/appLaunch',headers: {'authKey':authKey});
String data =response.body;
var name=jsonDecode(data)['categories'][0];

print(name);
  }
  @override
  Widget build(BuildContext context) {
   getdata();

    return Container();
  }
}
