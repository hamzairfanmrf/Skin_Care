import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skin_care/Model/Check_database.dart';
import 'package:skin_care/Model/Feature_products.dart';
import 'package:skin_care/API/api.dart';
import 'package:skin_care/displayUsingAPI/get_feature_products.dart';

import 'package:skin_care/displayUsingAPI/Display_cate.dart';
import 'Model/DisplayCart2.dart';
import 'Products_all/DisplayCart.dart';
import 'sizeConfig/size_config.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'Slider/Crouser.dart';
import 'splash_screen.dart';
import 'displayUsingAPI/below_buttons.dart';
import 'Model/categories.dart';

import 'package:sizer/sizer.dart';

import 'package:skin_care/displayUsingAPI/Display_cate.dart';


var  col=Color(0xFFD3D3D3);
var col2=Color(  0xFFD3D3D3);
const op=0.2;

var active_color1=Colors.black45;
var active_color2=Colors.black45;

var colorDepartment=Color(0xFF7FAD39);
var colorFeature=Color(0xFF000000);




class just_check extends StatefulWidget {
  static String routeName="/just_check";

  @override
  _just_checkState createState() => _just_checkState();
}

class _just_checkState extends State<just_check> {
  String dept="true";
  String feat="false";
  /* var cat=APi.instance;
  void getProducts() async {
    var a = await cat.Orders_List(context);

    print(cat.category.length);
    print(cat.category[0].c_name);
  }*/

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
/*getProducts();*/
  decide(){
    if(dept=="true"){
     return CheckImage();
    }
    if(feat=="true"){
     return  GetFeatureProduct();
    }

  }


    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }
    void active_color(){
      col=Colors.red;
      col2=Colors.teal;
    }

    SizeConfig().init(context);
    return Sizer(
        builder: (context, orientation, deviceType) {
          return Scaffold(
            backgroundColor: Color(0xFFFBFBFB),
            body: SizedBox(
              height: 200000,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                    children: [

                      SizedBox(height: getProportionateScreenWidth(10),
                      ),
                      SafeArea(
                        child: Container(

                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(width: SizeConfig.screenWidth * 0.6,
                                  margin: EdgeInsets.only(top: 5),
                                  //height: 50,

                                  decoration: BoxDecoration(
                                      color: Color(0xFFBABABA).withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(15)
                                  ),
                                  child: TextField(
                                    onChanged: (value) {

                                    },

                                    decoration: InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      hintText: 'Search product',

                                      prefixIcon: Icon(Icons.search
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: getProportionateScreenWidth(
                                              20),
                                          vertical: getProportionateScreenWidth(
                                              9)),


                                    ),
                                    textAlign: TextAlign.left,
                                    textAlignVertical: TextAlignVertical.center,
                                  ),
                                ),
                                IconButtonwithCounter(
                                  svgsrc: Icons.shopping_cart,

                                  press: () {
                                    setState(() {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => DisplayCart2() ),
                                      );
                                    });

                                  },
                                ),
                                IconButtonwithCounter(
                                  svgsrc: Icons.add_alert_rounded,
                                  no_of_items: 3,
                                  press: () {

                                  },
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: CarouselWithIndicatorDemo(),
                      ),

                      Container(

                        child: Column(
                          children: [
                            Row(


                              children: [


                                Column(
                                  children: [
                                    SizedBox(
                                      height: 70,

                                      child: Container(
                                        margin: EdgeInsets.only(left: 80),
                                        child: Padding(

                                          padding: const EdgeInsets.all(8),
                                          child: GestureDetector(


                                            child: Icon(
                                              Icons.business,
                                              size: 50,
                                              color: colorDepartment,
                                            ),
                                            onTap: () {
                                              setState(() {
                                                dept = "true";
                                                feat = "false";
                                                colorFeature =
                                                    Color(0xFF000000);
                                                colorDepartment =
                                                    Color(0xFF7FAD39);
                                              });
                                            },

                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 70),
                                      child: Text('Departments',
                                        style: TextStyle(
                                            color: colorDepartment,
                                            fontSize: 13

                                        ),

                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),

                                Column(
                                  children: [
                                    SizedBox(
                                      height: 70,
                                      child: Container(
                                        margin: EdgeInsets.only(left: 70),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: GestureDetector(child:
                                          Icon(
                                              Icons.post_add_rounded,
                                              size: 50,
                                              color: colorFeature
                                          ),
                                            onTap: () {
                                              setState(() {
                                                dept = "false";
                                                feat = "true";
                                                colorDepartment =
                                                    Color(0xFF000000);
                                                colorFeature =
                                                    Color(0xFF7FAD39);
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 70),
                                      child: Text(
                                        'Feature Products',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: colorFeature,
                                        ),
                                      ),
                                    )
                                  ],
                                ),

                              ],
                            ),
                            SizedBox(height: 1000,
                              child: Container(
                                child: decide(),
                              ),
                            ),
                          ],
                        ),
                      ),


                    ]
                ),
              ),
            ),


          );

        }
    );



  }
}

class SliderReuse extends StatelessWidget {
  int image_no=2;
  SliderReuse(@required this.image_no);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(
              'images/banner$image_no.png',
            ),
            fit: BoxFit.cover,
          )
      ),
    );
  }
}

class ReuseableCard extends StatelessWidget {
  int imgno;
  String txt;
  ReuseableCard(@required this.imgno,@required this.txt);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Padding(
      padding: EdgeInsets.all(4),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),


        ),

        child: Column(
          children: [
            Image(
              image: AssetImage('images/skincare_image$imgno.jpg'),
            ),
            Text(
              '$txt',
            )
          ],
        ),

      ),
    ),
    );
  }
}

class IconButtonwithCounter extends StatelessWidget {
  const IconButtonwithCounter({
    Key key, @required this.svgsrc,  this.no_of_items=0, @required this.press,
  }) : super(key: key);
  final IconData svgsrc;
  final int no_of_items;
  final GestureTapCallback press;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
      press,
      borderRadius: BorderRadius.circular(50),
      child: Stack(

          children:[

            Container(
              height: getProportionateScreenWidth(46),
              width: getProportionateScreenWidth(46),
              decoration: BoxDecoration(
                color: Color(0xFF979797).withOpacity(0.1),
                shape: BoxShape.circle,

              ),
              child: Icon(
                svgsrc,
                size: 25,
              ),

            ),
            if(no_of_items!=0)
              Positioned(
                right: 0,
                top: 1,
                child: Container(
                  height: getProportionateScreenWidth(16),
                  width: getProportionateScreenWidth(16),
                  decoration: BoxDecoration(
                    color: Color(0xFFFF4848),
                    shape: BoxShape.circle,
                    border: Border.all(width: 1.5,color: Colors.white),
                  ),
                  child: Center(
                    child: Text(
                      '$no_of_items',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(10),
                        height: 1,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),


          ]
      ),
    );
  }
}
