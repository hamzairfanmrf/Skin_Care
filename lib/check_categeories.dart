import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'isApiTrue.dart';

class IsCat {

  String id;
  String name;
  String arName;
  IconData ic;
  String dataFilter;
  IsCat(Response response){
    getsomething(response);
  }

getsomething(Response response){
  var data=response.body;
  IsCat c;
  c.id=jsonDecode(data)['categories'][0]['id'];
  c.name=jsonDecode(data)['categories'][0]['name'];
  c.arName=jsonDecode(data)['categories'][0]['name_ar'];
  return c;

}

}


