

import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/services.dart';
import 'package:skin_care/Check_List.dart';
import 'package:skin_care/api.dart';
import 'package:skin_care/categories.dart';
import 'package:skin_care/check_list_only.dart';
import 'package:skin_care/image_slider.dart';
import 'package:skin_care/size_config.dart';
import 'package:skin_care/splash_screen.dart';
import 'just_check.dart';
import 'dart:async';
import 'splash_screen.dart';
import 'blank.dart';


import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Crouser.dart';
import 'Another_navigation.dart';


class MyHomePage extends StatefulWidget {





  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final autoSizeGroup = AutoSizeGroup();
  var _bottomNavIndex = 0; //default index of a first screen

AnimationController _animationController;
   Animation<double> animation;
   CurvedAnimation curve;

  final iconList = <IconData>[
    Icons.home_rounded,
    Icons.local_offer,
    Icons.favorite,
    Icons.menu_outlined,
  ];

  @override
  void initState() {
    super.initState();



    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);

    Future.delayed(
      Duration(seconds: 1),
          () => _animationController.forward(),
    );
  }

  @override
  Widget build(BuildContext context) {
int i=0;

   String  decideText(int index) {
       if (index == 0) {
         return "Home";
       }
       if (index == 1) {
         return "Offers";
       }
       if (index== 2) {
         return "Favourites";
       }
       if (index == 3) {
         return "More";
       }
       return "aaa";
     }
      decideScreen(int index){
     if(index==0){
     var splash=new SplashScreen();
return splash;

     }
       if(index==1){
        var blank=new MyApp();
        return blank;

     }
       if(index==2){
         var blank=CheckList();
         return blank;
       }
       if(index==3){
         var blank=AnotherNav();
         return blank;
       }

     }
    return
      Scaffold(

        body:just_check(

        ),
        backgroundColor: Color(0xFFFBFBFB),

        floatingActionButton: ScaleTransition(
          scale: animation,
          child: FloatingActionButton(
            elevation: 8,
            backgroundColor: HexColor('#7EAD39'),
            child: Icon(
              Icons.shopping_cart_outlined,
              color:Colors.white,
            ),
            onPressed: () {
              _animationController.reset();
              _animationController.forward();

            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: iconList.length,
          tabBuilder: (int index, bool isActive) {
            final color = isActive ? HexColor('#7EAD39') : Colors.white;
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [



                InkWell(
                  child: Icon(
                    iconList[index],
                    size: 24,
                    color: color,

                  ),
                  onTap: (){
                    i=index;
                    var store= decideScreen(i);
                    i=0;
                    setState(() {
                   print('index$index');
                   Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) =>
                           store)

                   );
                    });
                  },
                ),

                const SizedBox(height: 4),


                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child:
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: AutoSizeText(
                      decideText(index),


                      maxLines: 1,
                      style: TextStyle(color: color),
                      group: autoSizeGroup,
                    ),

                  )

                ),

              ],
            );
          },
          backgroundColor: HexColor('#373A36'),
          activeIndex: _bottomNavIndex,
          splashColor: HexColor('#FFA400'),
          notchAndCornersAnimation: animation,
          splashSpeedInMilliseconds: 300,
          notchSmoothness: NotchSmoothness.defaultEdge,
          gapLocation: GapLocation.center,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          onTap: (index) => setState(() => _bottomNavIndex = index
          ),

        ),
      );
  }
}

class NavigationScreen extends StatefulWidget {
  final IconData iconData;

  NavigationScreen(this.iconData) : super();

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen>
    with TickerProviderStateMixin {
   AnimationController _controller;
 Animation<double> animation;

  @override
  void didUpdateWidget(NavigationScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.iconData != widget.iconData) {
      _startAnimation();
    }
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
    super.initState();
  }

  _startAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
