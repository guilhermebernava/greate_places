import 'package:flutter/material.dart';

class AppColors {
  static const black = Color(0xff262626);
  static const primary = Color(0xffF26513);
  static const primaryLight = Color(0xffF27B13);
  static const yellow = Color(0xffF2A516);
  static const secundary = Color(0xff00A6A5);
  static const secundaryLight = Color(0xff13F2F1);

  static const color = 0xffF26513;

  static const Map<int, Color> colors = {
    50: Color.fromRGBO(242, 101, 19, 0.098),
    100: Color.fromRGBO(242, 101, 19, .2),
    200: Color.fromRGBO(242, 101, 19, .3),
    300: Color.fromRGBO(242, 101, 19, .4),
    400: Color.fromRGBO(242, 101, 19, .5),
    500: Color.fromRGBO(242, 101, 19, .6),
    600: Color.fromRGBO(242, 101, 19, .7),
    700: Color.fromRGBO(242, 101, 19, .8),
    800: Color.fromRGBO(242, 101, 19, .9),
    900: Color.fromRGBO(242, 101, 19, 1),
  };

  static const appMaterialColor = MaterialColor(color, colors);
}
