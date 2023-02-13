import 'package:flutter/material.dart';

abstract class Style{
  Style._();
  // colors
  static  Color green=const Color(0xff0F9565);
  static Color black=const Color(0xff131313);
  static Color white= Colors.white;
  // TextStyle
  static TextStyle greenNormalText=TextStyle(fontSize: 32,fontWeight: FontWeight.w700,fontStyle: FontStyle.normal,color: Style.green);
  static TextStyle whiteNormalText= TextStyle(fontSize: 32,fontWeight: FontWeight.w700,fontStyle: FontStyle.normal,color: Style.white);
  static TextStyle whiteTextNormalSize=TextStyle(fontSize: 40,fontWeight: FontWeight.w600,fontStyle: FontStyle.normal,color: Style.white);
  static TextStyle whiteText400=TextStyle(fontSize: 16,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal,color: Style.white);
  static TextStyle whiteInkwel=TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Style.white);
}