
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:skin_care/image_slider.dart';
import 'package:skin_care/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skin_care/size_config.dart';
import 'package:carousel_slider/carousel_slider.dart';

class home_page extends StatefulWidget {
  static String routeName="/home";

  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
backgroundColor: Color(0xFFFBFBFB),
      body: Container(
        margin: EdgeInsets.only(top: 15),
        child: SingleChildScrollView(

          child: Column(
            children: [
              SizedBox(height: getProportionateScreenWidth(20),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(width: SizeConfig.screenWidth * 0.6,
                    margin: EdgeInsets.only(top: 10),
                    //height: 50,

                    decoration: BoxDecoration(
                      color: Color(0xFFBABABA).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15)
                    ),
                      child: TextField(
                        onChanged: (value){

                        },

                        decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: 'Search product',

                          prefixIcon:Icon( Icons.search
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20),vertical: getProportionateScreenWidth(9)),



                        ),
                        textAlign: TextAlign.left,
                        textAlignVertical: TextAlignVertical.center,
                      ),
                    ),
                    IconButtonwithCounter(
                      svgsrc: Icons.shopping_cart,

                      press: (){

                      },
                    ),
                    IconButtonwithCounter(
                      svgsrc: Icons.add_alert_rounded,
                      no_of_items: 3,
                      press: (){

                      },
                    ),

                  ],
                ),


              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child:CarouselSlider(

                  options: CarouselOptions(
                    height: 200,
                    aspectRatio: 16/9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,

                    scrollDirection: Axis.horizontal,
                  ),
                  items: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(
                              'images/skincare_image8.png',
                            ),
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                  ],

                ),
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
        overflow: Overflow.visible,
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
