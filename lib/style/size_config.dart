import 'package:flutter/material.dart';

class AppSize{
  static MediaQueryData? _mediaQuery;
  static double? height;
  static double? width;
  static double? vertical;
  static double? horizontal;
  init(BuildContext context){
    _mediaQuery=MediaQuery.of(context);
    height=_mediaQuery!.size.height;
    width=_mediaQuery!.size.width;
    horizontal=width!/100;
    vertical=height!/100;
  }
}

double getH(double height){
  double screenHeight=AppSize.height!;
  return (height/640)*screenHeight;
}

double getW(double width){
  double screenWidth=AppSize.width!;
  return (width/640)*screenWidth;
}