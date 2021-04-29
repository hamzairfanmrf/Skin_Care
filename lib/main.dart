import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skin_care/check_api.dart';
import 'Get_Products.dart';
import 'get_feature_products.dart';
import 'infinite_scroll.dart';

import 'package:skin_care/home_page.dart';
import 'package:skin_care/image_slider.dart';
import 'package:skin_care/routes.dart';
import 'package:skin_care/splash_screen.dart';

import 'Login.dart';
import 'dart:async';
import 'package:provider/provider.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'api.dart';
import 'Check_List.dart';


import 'below_buttons.dart';
import 'categories.dart';
import 'isApiTrue.dart';
import 'Display_Products.dart';
import 'check_list_only.dart';
import 'package:skin_care/Check_Image_Alignment.dart';
import 'Another_navigation.dart';





void main() {


  runApp(MaterialApp(

    debugShowCheckedModeBanner: false,

home: MyHomePage(

),
  ),
  );
  }












