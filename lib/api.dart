import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:skin_care/Feature_products.dart';
import 'package:skin_care/Products.dart';
import 'package:skin_care/categories.dart';
import 'package:skin_care/main.dart';
import 'Feature_products.dart';


import 'package:http/http.dart' as http;



class APi {

  static final APi _singleton = new APi._internal();

  APi._internal();

  static APi get instance => _singleton;
  List<Categories> category = List<Categories>();
  String baseURLCategories = "";
  String baseURLfeatureProducts = "https://www.essentialkonjacskinfoods.com/admin/assets/images/products/";
  String baseURL = "https://www.essentialkonjacskinfoods.com/";
  String baseURLProducts="https://www.essentialkonjacskinfoods.com/admin/assets/images/products/";
  List<FeatureProducts> fp = [];
  List<Product> product=[];


  Future<dynamic> Orders_List(BuildContext context) async {
    String authKey = 'kt5OMQXn4LktxViHZnGR2uR5jqUBlmH2rpS8AS6cPf9Pz57yZ0DNm34kJcnAwqaJ';
    var url = baseURL + 'Home/appLaunch';
    http.Response response = await http.get(url, headers: {"authKey": authKey});

    var data = json.decode(response.body);
    category.clear();
    data['categories'].forEach((value) {
      Categories order = new Categories.fromJson(value);
      category.add(order);
    });

    baseURLCategories = data['baseURLCategories'];

    //print(jsonEncode(category));
    //print(baseURLCategories);
    //
    //
    //
    //     data['categories'].forEach((id,name,name_ar,data_filter){
    //
    //       ordersList.add(Categories(
    //         c_id: id,
    //
    //           arName:name_ar,
    //         dataFilter: data_filter,
    //
    //       ));
    //
    //     });


    return data;


    // SuccessMessage("Order list", "Successfully Refreshed Order List", context);


  }

  Future<dynamic> featureProducts(BuildContext context) async {
    String authKey = 'kt5OMQXn4LktxViHZnGR2uR5jqUBlmH2rpS8AS6cPf9Pz57yZ0DNm34kJcnAwqaJ';
    var url = baseURL + 'Home/appLaunch';
    http.Response response = await http.get(url, headers: {"authKey": authKey});

    var data = json.decode(response.body);


    fp.clear();

    data['featureProducts'].forEach((value) {
      FeatureProducts order = new FeatureProducts.fromJson(value);

      fp.add(order);
    });


    // SuccessMessage("Order list", "Successfully Refreshed Order List", context);
    return data;
  }

  Future<dynamic> Products(BuildContext context,int cat_id) async {
    String authKey = 'kt5OMQXn4LktxViHZnGR2uR5jqUBlmH2rpS8AS6cPf9Pz57yZ0DNm34kJcnAwqaJ';
    var url = baseURL + 'Products/appProductList?categoryId=$cat_id';
    http.Response response = await http.get(url, headers: {"authKey": authKey});

    var data = json.decode(response.body);


    product.clear();

    data['products'].forEach((value) {
      Product order = new Product.fromJson(value);

      product.add(order);
    });


    // SuccessMessage("Order list", "Successfully Refreshed Order List", context);
    return data;
  }

  Future<dynamic> Banners(BuildContext context) async {
    String authKey = 'kt5OMQXn4LktxViHZnGR2uR5jqUBlmH2rpS8AS6cPf9Pz57yZ0DNm34kJcnAwqaJ';
    var url = baseURL + 'Products/appProductList?categoryId=';
    http.Response response = await http.get(url, headers: {"authKey": authKey});

    var data = json.decode(response.body);


    product.clear();

    data['products'].forEach((value) {
      Product order = new Product.fromJson(value);

      product.add(order);
    });


    // SuccessMessage("Order list", "Successfully Refreshed Order List", context);
    return data;
  }







}











  

  





