import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Products_all/products_detail.dart';
import 'displayUsingAPI/Get_Products.dart';
import 'package:skin_care/displayUsingAPI/Display_cate.dart';
import 'displayUsingAPI/get_feature_products.dart';




import 'package:skin_care/Routes/routes.dart';
import 'package:skin_care/splash_screen.dart';

import 'Login.dart';
import 'dart:async';
import 'package:provider/provider.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'API/api.dart';



import 'displayUsingAPI/below_buttons.dart';
import 'Model/categories.dart';

import 'package:skin_care/displayUsingAPI/Display_cate.dart';
import 'Navigation_bar/Another_navigation.dart';





void main() {


  runApp(MaterialApp(

    debugShowCheckedModeBanner: false,

home:MyHomePage(

),
  ),
  );
  }












