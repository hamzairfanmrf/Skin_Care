import 'dart:convert';

import 'package:floating_ribbon/floating_ribbon.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:skin_care/Model/Feature_products.dart';
import 'package:skin_care/API/api.dart';
import 'package:ribbon/ribbon.dart';
import 'package:skin_care/Products_all/featureProductDetail.dart';
import 'package:skin_care/Products_all/featureProductsWithoutRibbon.dart';



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

                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        '${feature[index].c_name}',
                        style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'Source Sans Pro',
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25),
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
                    ),
                    Container(
                      height: 20,
                    )


                  ],
                ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(1, 0, 15,150),
                  child: Icon(

                    Icons.favorite,
                    color: Color(0xFFBABABA),


                  ),
                ),


              ],
            ),



          ),
        ),
        onTap: (){
          setState(() {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  DetailFeature(feature[index].c_name,feature[index].description,feature[index].ic)),
            );

          });
        },
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

                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        '${feature[index].c_name}',
                        style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'Source Sans Pro',
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25),
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
                    ),
                    Container(
                      height: 20,
                    )


                  ],
                ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(1, 0, 15,150),
                  child: Icon(

                    Icons.favorite,
                  color: Color(0xFFBABABA),

                  ),
                ),


              ],
            ),



          ) ,
        ),
        onTap: (){
          setState(() {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  FeatureProductRibbonLess(feature[index].c_name,feature[index].description,feature[index].ic)),
            );


          });
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    getFeatureProducts();

    return Scaffold(

        body:SingleChildScrollView(
          scrollDirection: Axis.vertical,

          child: SizedBox(
            height: 250,
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

