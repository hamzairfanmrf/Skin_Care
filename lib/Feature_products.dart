

import 'package:flutter/material.dart';

class FeatureProducts {
  String c_id;
  String c_name;
  String arName;
  String ic;

  String dataFilter;
  String description;
  String description_ar;
  String offer;
  //int price;
  //int priority;

  FeatureProducts(
      {this.c_id, this.c_name, this.arName, this.ic, this.dataFilter, this.description, this.description_ar,this.offer});


  factory FeatureProducts.fromJson(Map<String, dynamic> json){
    return FeatureProducts(
        c_id: json['c_id'] as String,
        c_name: json['name'] as String,
        arName: json['name_ar'] as String,
        ic: json['image'] as String,



        dataFilter: json['data_filter'] as String,
      description: json['description'] as String,
      description_ar: json['description_ar'] as String,
     // price: json['price'] as int,
      //priority: json['priority'] as int,
      offer: json['offer'] as String,







    );


  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{
      'id': c_id,
      'name': c_name,
      'name_ar': arName,
      'image':ic,
      'data_filter':dataFilter,


      'data_filters': dataFilter,
      'description': description,
      'description_ar':description_ar,
      'offer':offer,


    };


    return json;
  }
}

