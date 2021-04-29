import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skin_care/api.dart';
import 'package:skin_care/categories.dart';
import 'dart:async';


class DisplayProduct extends StatefulWidget {

  @override
  _DisplayProductState createState() => _DisplayProductState();

}

class _DisplayProductState extends State<DisplayProduct> {

  var cat=APi.instance;



  void getProducts() async {
    var a = await cat.Orders_List(context);

    print(cat.category.length);
    print(cat.category[0].c_name);
  }

        @override

  Widget build(BuildContext context) {

getProducts();



    return Container(
      color: Colors.white,
      child: ListView.builder(itemCount: cat.category.length,
scrollDirection: Axis.vertical,
itemBuilder: (context,int i){
return Card(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0),

  ),
  child: Column(
    children: [
Padding(padding:EdgeInsets.all(10),
child: Row(
  children: [
    Expanded(child: Text(
    'CatergoryID#${cat.category[i].c_name}'
    ),

    )
  ],
),

),



    ],
  ),
);
}
      ),
    );
  }
}



