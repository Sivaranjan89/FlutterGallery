import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewBottomTabBar extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewBottomTabBar> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController( //Assign a tab controller else tab bar will throw an error
      length: 3, //Specify the total number of tabs
      initialIndex: 0, //The starting tab to be highlighted
      child: Scaffold(
        backgroundColor: ApplicationConstants.appBlue,

        appBar: AppBar(backgroundColor: Colors.black,
          leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30), onPressed: () {
            Navigator.pop(context);
          }),
          title: Text('Bottom Tab Bar', style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'londrina')),
          centerTitle: true,
        ),

        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
        ),

        body: TabBarView(children: <Widget>[ //Design the view for each tab here
          Center(child: Text('Profile Page')),
          Center(child: Text('Maps Page')),
          Center(child: Text('Contact Us Page'))
        ],
        ),

        bottomNavigationBar: Container(color: Colors.black,
        child: TabBar(tabs: <Widget>[ //Design the tab icons here
          Tab(icon: Icon(Icons.account_box), text: "Profile"), //it can be any widget, not just icons
          Tab(icon: Icon(Icons.pin_drop), text: "Maps"),
          Tab(icon: Icon(Icons.add_call), text: "Contact Us"),
        ], indicatorColor: Colors.transparent, labelColor: Colors.white, unselectedLabelColor: Colors.blueGrey)),
      ),
    );
  }

  void showCode() {
    Dialog dialog = ApplicationConstants.getCodeDialog('https://docs.google.com/document/d/e/2PACX-1vSVynfcKQ9xoZXJfdU8RfXi7sxU7qZc42jAdv9CaMwd0zz7LXxBKcZ6DOwWAB04bOTqtJvg_dajhdpX/pub');
    showDialog(context: context, builder: (context) => dialog);
  }
}