import 'package:flutter/material.dart';
import 'package:ribbon/ribbon.dart';
import 'package:skin_care/API/api.dart';
import 'package:skin_care/displayUsingAPI/below_buttons.dart';
import 'package:skin_care/displayUsingAPI/get_feature_products.dart';
String nam;
String img;
String desc;

class DetailFeature extends StatefulWidget {
  DetailFeature(String name,String description,String image){
    img=image;
    desc=description;
    nam=name;
  }
  @override
  _DetailFeatureState createState() => _DetailFeatureState();
}

class _DetailFeatureState extends State<DetailFeature> {
  APi products=APi.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDEDEDE),
      appBar: CustomAppBar(

      ),
      body: Column(
        children: [
          SizedBox(
            width: 300,

            child: Ribbon(
              nearLength: 60,
              farLength: 90,
              title: 'New!',
              titleStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              color:  Color(0xFF7FAD39),
              location: RibbonLocation.topStart,
              child: Container(

                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image(
                    image: NetworkImage(products.baseURLfeatureProducts+img),
                  ),
                ),
              ),
            ),

          ),
          Row(
            children: [


            ],
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50),

              ),

            ),

            height: 400,
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    '$nam',
                    style: TextStyle(

                        fontSize: 30,
                        color: Colors.black),


                  ),
                ),

                Padding(padding: EdgeInsets.only(left: 30,right: 60),
                  child: Text(
                    "$desc",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Source Sans Pro',

                    ),
                  ),
                ),
                Row(
                  children: [

                    Container(
                      margin: EdgeInsets.only(left: 120),

                      child: TextButton(


                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        style: ButtonStyle(

                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  side: BorderSide(color: Colors.white)
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xFF7FAD39)
                            )
                        ),


                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30),

                      child: TextButton(


                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                        style: ButtonStyle(

                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  side: BorderSide(color: Colors.white)
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xFF7FAD39)
                            )
                        ),


                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(
                    child: Container(
                      height: 60,

                      width: 200,
                      decoration: BoxDecoration(
                        color:  Color(0xFF7FAD39),
                        borderRadius: BorderRadius.circular(80),

                      ),

                      child: TextButton(
                        child: Text(
                          'ADD to CART',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white
                          ),

                        ),
                      ),
                    ),
                  ),
                )


              ],
            ),


          ),



        ],
      ),
    );
  }
}


class CustomAppBar extends PreferredSize{
  @override
  Size get preferredSize =>Size.fromHeight(AppBar().preferredSize.height);
  @override
  Widget build(BuildContext context){

    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(


            child: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.white,
            ),
            style: ButtonStyle(

                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0),
                      side: BorderSide(color: Colors.white)
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color(0xFF7FAD39)
                )
            ),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  MyHomePage()),
              );

            },


          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14,vertical: 5),
            child: Row(
              children: [
                Icon(
                  Icons.favorite,
                  color: Colors.green,
                  size: 32,
                )
              ],
            ),
          )

        ],
      ),
    );

  }
}
