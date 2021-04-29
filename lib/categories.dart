import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:skin_care/check_api.dart';
import 'api.dart';

class Categories {
  String c_id;
  String c_name;
  String arName;
  String img;

  String dataFilter;

  Categories({this.c_id, this.c_name, this.arName,this.img,this.dataFilter});

  factory Categories.fromJson(Map<String, dynamic> json){
    return Categories(
        c_id: json['id'] as String,
        c_name: json['name'] as String,
        arName: json['name_ar'] as String,
        img: json['icon'] as String,

        dataFilter: json['data_filter'] as String);
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{
      'id': c_id,
      'name': c_name,
      'name_ar': arName,

      'data_filters': dataFilter
    };


    return json;
  }

}



