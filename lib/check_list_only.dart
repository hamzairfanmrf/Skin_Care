import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:skin_care/api.dart';
import 'package:skin_care/categories.dart';



class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  APi items=APi.instance;
  List<Categories> myCatgories = new List<Categories>();

  void getProducts() async {
    var a = await items.Orders_List(context);

    setState(() {
      myCatgories = items.category;
    });
  }






  final String title="Long string";


  @override
  Widget build(BuildContext context) {
    getProducts();
    return  ListView.builder(
          itemCount: myCatgories.length,
      shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index)

    {

      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),


          child:  Row(


              children: [

                Expanded(child: Column(
                  children: [
                    Container(
                      height: 100,

                      child: Image(
                        image: NetworkImage(
                            items.baseURLCategories + myCatgories[index].img),
                      ),
                    ),
                    Container(
                      child:Text(
                        '${myCatgories[index].c_name}',
                        style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                        ),
                      ),
                    ),
                  ],
                ),
                ),


              ],
            ),


        );

    },


        );

  }
}

