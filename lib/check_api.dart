import 'package:flutter/material.dart';
import 'package:skin_care/main.dart';
import 'package:http/http.dart ' as http;

class Check extends StatefulWidget {

  @override
  _CheckState createState() => _CheckState();
}
getdata() async{
  var authKey='kt5OMQXn4LktxViHZnGR2uR5jqUBlmH2rpS8AS6cPf9Pz57yZ0DNm34kJcnAwqaJ';
  http.Response response= await http.get('https://www.essentialkonjacskinfoods.com/Home/appLaunch',headers: {"authKey": authKey} );

  print(response.body);

}

class _CheckState extends State<Check> {

  @override
  Widget build(BuildContext context) {
    getdata();
    return Container(

    );
  }
}
