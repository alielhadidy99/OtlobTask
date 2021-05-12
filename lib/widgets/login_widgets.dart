import 'package:flutter/material.dart';


Widget defaultFormTextField({
  TextEditingController controller,
  TextInputType type,
  Function onSubmit,
  Function validate,
  IconData suffix,
  Function suffixFunction,
  bool isPassword = false,
  String hintText,
  Color backgroungColor,
  double radius,
  Color hintColor,
  String fontFamily,
  double hintSize,
  Color iconColor,
}) =>
    TextFormField(
      obscureText: isPassword,
      validator: validate,
      controller: controller,
      onFieldSubmitted: onSubmit,
      keyboardType: type,
      decoration: InputDecoration(
        filled: true,
        fillColor: backgroungColor,
        contentPadding: EdgeInsets.only(right: 20, top: 30),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(radius)),
        hintText: hintText,
        hintStyle: TextStyle(color: hintColor, fontSize: hintSize,fontFamily: fontFamily),
        suffixIcon: suffix != null
            ? GestureDetector(
                onTap: suffixFunction,
                child: Icon(
                  suffix,
                  color: iconColor,
                ))
            : null,
      ),
    );
