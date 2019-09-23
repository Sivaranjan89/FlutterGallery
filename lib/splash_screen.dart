import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_constants.dart';
import 'home/home_screen.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    //Load Homepage after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        Navigator.pushReplacement(context, PageRouteBuilder(transitionDuration: Duration(seconds: 2) ,
            pageBuilder: (_, __, ___) => HomeScreen()));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationConstants.appBlue,
      body: Center(
        child: Hero(
          tag: "logo",
          child: Image.asset('assets/images/logo.png', width: 250),
        ),
      ),
    );
  }
}
