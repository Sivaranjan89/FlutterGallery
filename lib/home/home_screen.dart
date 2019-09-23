import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/app_constants.dart';
import 'package:flutter_gallery/home/home_page.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationConstants.appBlue,
      appBar: renderAppBar(),
      body: HomePage()
    );
  }

  Widget renderAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      leading: Container(margin: EdgeInsets.only(left: 10),
      child: Hero(tag: "logo", child: Image.asset('assets/images/logo.png', width: 80, color: Colors.white))),
      title: Text('Flutter Gallery', style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'londrina')),
      centerTitle: true,
    );
  }
}
