import 'dart:async';
import 'package:flutter/material.dart';
import 'package:otlob_task/main.dart';
import 'package:otlob_task/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  MyApp myApp = MyApp();

  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 2), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/splash_screen/background.png"),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Image.asset(
            'assets/images/splash_screen/logo.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
