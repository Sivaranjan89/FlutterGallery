import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/app_constants.dart';
import 'package:flutter_gallery/home/home_page.dart';

class HomeScreen extends StatefulWidget {
  static String searchedKeyword = '';

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  var isSearch = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    if (isSearch) {
      return Scaffold(
          backgroundColor: ApplicationConstants.appBlue,
          appBar: renderAppBar(),
          body: HomePage());
    } else {
      return Scaffold(
          backgroundColor: ApplicationConstants.appBlue,
          appBar: renderAppBar(),
          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.black,
              child: Icon(Icons.search, color: Colors.white, size: 30),
              onPressed: () {
                setState(() {
                  isSearch = true;
                });
              }),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          body: HomePage());
    }
  }

  Widget renderAppBar() {
    if (isSearch) {
      return AppBar(
        backgroundColor: Colors.black,
        leading: Container(
            margin: EdgeInsets.only(left: 10),
            child: Hero(
                tag: "logo",
                child: Image.asset('assets/images/logo.png',
                    width: 80, color: Colors.white))),
        actions: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  width: 290,
                  child: TextField(
                      decoration: InputDecoration.collapsed(
                          hintText: 'Search',
                          hintStyle:
                              TextStyle(color: Colors.white, fontSize: 20)),
                      autofocus: true,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      onChanged: (text) {
                        setState(() {
                          HomeScreen.searchedKeyword = text;
                        });
                      }))
            ],
          ),
          IconButton(
              icon: Icon(Icons.close, color: Colors.white, size: 30),
              onPressed: () {
                setState(() {
                  isSearch = false;
                  HomeScreen.searchedKeyword = '';
                });
              })
        ],
      );
    } else {
      return AppBar(
        backgroundColor: Colors.black,
        leading: Container(
            margin: EdgeInsets.only(left: 10),
            child: Hero(
                tag: "logo",
                child: Image.asset('assets/images/logo.png',
                    width: 80, color: Colors.white))),
        title: Text('Flutter Gallery',
            style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'londrina')),
        centerTitle: false,
        actions: <Widget>[],
      );
    }
  }
}
