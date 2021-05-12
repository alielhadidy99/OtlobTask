import 'package:flutter/material.dart';

Widget normalText({
  double fontSize,
  Color color,
  FontWeight fontWeight,
  String text,
  TextAlign textAlign,
  String fontFamily,
}) =>
    Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
          fontFamily: fontFamily),
      textAlign: textAlign,
    );
