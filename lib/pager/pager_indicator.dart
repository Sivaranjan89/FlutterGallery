import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewViewpagerIndicator extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewViewpagerIndicator> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: ApplicationConstants.appBlue,
        appBar: PreviewAppBar(appBar: AppBar(), title: 'Pager with Indicator'),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: TabBarView(children: <Widget>[ //Design the view for each tab here
                Center(child: Text('Profile Page')),
                Center(child: Text('Maps Page')),
                Center(child: Text('Contact Us Page'))
              ]),
            ),
            TabPageSelector(selectedColor: Colors.black, indicatorSize: 20, color: ApplicationConstants.appBlue)
          ],
        ),
      ),
    );
  }

  void showCode() {
    Dialog dialog = ApplicationConstants.getCodeDialog('https://docs.google.com/document/d/e/2PACX-1vSiFRAsO0CeVLq6RbHp5SCmzqgOmZ6QgWqL5uWhSZG7RBBlT5nXWqbkkgpdOXpcVrBCQD5NSYPHXAOh/pub');
    showDialog(context: context, builder: (context) => dialog);
  }
}
