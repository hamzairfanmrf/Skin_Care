import 'dart:convert';

import 'package:floating_ribbon/floating_ribbon.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:skin_care/Model/Feature_products.dart';
import 'package:skin_care/API/api.dart';
import 'package:ribbon/ribbon.dart';
import '../Products_all/check_products.dart';


class GetFeatureProduct extends StatefulWidget {
  @override
  _GetFeatureProductState createState() => _GetFeatureProductState();
}

class _GetFeatureProductState extends State<GetFeatureProduct> {
  List<FeatureProducts> feature= new List<FeatureProducts>();
  APi pro=APi.instance;
  getFeatureProducts() async{
    var a=await pro.featureProducts(context);
    print(a);
    print(pro.fp.length);
    setState(() {
      feature=pro.fp;
    });

  }
  choose(int index){
    print("index after passing $index");
    int a=int.parse(feature[index].offer);
    if(a==0){
      print(jsonEncode(feature[index]));
      return GestureDetector(
        child: Ribbon(
          nearLength: 40,
          farLength: 70,
          title: 'New!',
          titleStyle: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold),
          color: Color(0xFF7FAD39),
          location: RibbonLocation.topStart,


          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),

            ),



            child:  Row(


              children: [


                Expanded(child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(3),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.white,
                            child: CircleAvatar(
                              radius: 60,
                              backgroundColor: Color(0xFFF1F3F4),
                              backgroundImage: NetworkImage(
                                  pro.baseURLfeatureProducts + feature[index].ic),


                            ),

                          ),
                        ),

                      ),




                    ),

                    SizedBox(
                      height: 2,
                    ),

                    Text(
                      '${feature[index].c_name}',
                      style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Source Sans Pro',
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      color: Color(0xFF7FAD39),
                      height: 30,
                      child: ElevatedButton(
                        child: Text(
                          'Add to cart',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )


                  ],
                ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(1, 0, 15,150),
                  child: Icon(

                    Icons.favorite,
                    color: Colors.lightGreen,

                  ),
                ),


              ],
            ),



          ),
        ),
      );

    }
    else {
      print(jsonEncode(feature[index]));
      return GestureDetector(
        child: Container(
          height: 400,

          child:  Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),

            ),



            child:  Row(


              children: [


                Expanded(child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(3),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.white,
                            child: CircleAvatar(
                              radius: 60,
                              backgroundColor: Color(0xFFF1F3F4),
                              backgroundImage: NetworkImage(
                                  pro.baseURLfeatureProducts + feature[index].ic),


                            ),

                          ),
                        ),

                      ),




                    ),

                    SizedBox(
                      height: 2,
                    ),

                    Text(
                      '${feature[index].c_name}',
                      style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Source Sans Pro',
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      color: Color(0xFF7FAD39),
                      height: 30,
                      child: ElevatedButton(
                        child: Text(
                          'Add to cart',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )


                  ],
                ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(1, 0, 15,150),
                  child: Icon(

                    Icons.favorite,
                    color: Colors.lightGreen,

                  ),
                ),


              ],
            ),



          ) ,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    getFeatureProducts();

    return Scaffold(
        appBar: AppBar(
          centerTitle:true,
          backgroundColor: Color(0xFFF1F3F4),
          title: Text(
            'Feature Products',
            textAlign: TextAlign.center,


            style: TextStyle(
              fontFamily: 'Source Sans Pro',
              color: Color(0xFF7FAD39),
              fontWeight: FontWeight.w600
            ),
          ),
        ),



        body:SingleChildScrollView(
          scrollDirection: Axis.vertical,

          child: SizedBox(
            height: 300,
            child: GridView.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,

            ),
                itemCount: feature.length,
                shrinkWrap: true,
                //scrollDirection: Axis.vertical,

                itemBuilder: (BuildContext context, int itemBuilderIndex) {
                return choose(itemBuilderIndex);
            }
            ),
          ),
        ),
  );

  }
}

