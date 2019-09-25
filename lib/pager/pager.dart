import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewViewpager extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewViewpager> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationConstants.appBlue,
      appBar: PreviewAppBar(appBar: AppBar(), title: 'ViewPager'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
      ),
      body: PageView(
        scrollDirection: Axis.horizontal,
        pageSnapping: true,
        reverse: false,
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Center(child: Text('Screen 1', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40))),
          Center(child: Text('Screen 2', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40))),
          Center(child: Text('Screen 3', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)))
        ],
      ),
    );
  }

  void showCode() {
    Dialog dialog = ApplicationConstants.getCodeDialog('https://docs.google.com/document/d/e/2PACX-1vSiFRAsO0CeVLq6RbHp5SCmzqgOmZ6QgWqL5uWhSZG7RBBlT5nXWqbkkgpdOXpcVrBCQD5NSYPHXAOh/pub');
    showDialog(context: context, builder: (context) => dialog);
  }
}
