import 'package:flutter/material.dart';

class Product{
  String id;
  String c_id;
  String name;
  String ar_name;
  String description;
  String description_ar;
  String offer;
  String oldprice;
  String price;
  String image;
  Product({this.id,this.c_id,this.name,this.ar_name,this.description,this.description_ar,this.offer,this.oldprice,this.image,this.price});

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      id: json['id'] as String,
      c_id: json['c_id'] as String,
      name: json['name'] as String,
      ar_name: json['name_ar'] as String,
      image: json['image'] as String,




      description: json['description'] as String,
      description_ar: json['description_ar'] as String,
      // price: json['price'] as int,
      //priority: json['priority'] as int,
      offer: json['offer'] as String,
      oldprice: json['old_price'] as String,
      price: json['price'] as String







    );


  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{
      'id': id,
      'c_id':c_id,
      'name': name,
      'name_ar': ar_name,
      'image':image,




      'description': description,
      'description_ar':description_ar,
      'offer':offer,
      'old_price':oldprice,
      'price':price,


    };


    return json;
  }



}

