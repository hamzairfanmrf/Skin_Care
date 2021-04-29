import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQuery;
  static double screenWidth;
  static double screenHeight;
  static double defaultSize;
  static Orientation orientation;


  void init(BuildContext context) {
    _mediaQuery = MediaQuery.of(context);
    screenWidth = _mediaQuery.size.width;
    screenHeight = _mediaQuery.size.height;
    orientation = _mediaQuery.orientation;
  }
  double getscreenwidth(){
    return screenWidth;
  }


}


double getProportionateScreenHeight(double inputHeight){

  double screenHeight=SizeConfig.screenHeight;
  return (inputHeight/812.0)*screenHeight;

}

double getProportionateScreenWidth(double inputWidth){

  double screenWidth=SizeConfig.screenWidth;
  return (inputWidth/375.0)*screenWidth;

}
