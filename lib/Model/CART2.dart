import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class Cart2 {
  int id;
  String product_id;
  String price;
  int quantity;
  String total;
  String status;
  String c_Id;
  String name;
  String description;
  String image;

  Cart2({this.id,this.product_id,this.price,this.quantity,this.total,this.status,this.c_Id,this.name,this.description,this.image});




  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'product_id': product_id,
      'price': price,
      'quantity': quantity,
      'total': total,
      'status': status,
      'c_Id': c_Id,
      'description': description,
      'image':image
    };
  }
}

