import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../app_constants.dart';

class PreviewScrollableTabBar extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PreviewScrollableTabBar> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController( //Assign a tab controller else tab bar will throw an error
      length: 5, //Specify the total number of tabs
      initialIndex: 0, //The starting tab to be highlighted
      child: Scaffold(
        backgroundColor: ApplicationConstants.appBlue,
        appBar: AppBar(backgroundColor: Colors.black,
          leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30), onPressed: () {
            Navigator.pop(context);
          }),
          title: Text('Scrollable Tabs', style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'londrina')),
          centerTitle: true,
          bottom: TabBar(isScrollable: true, //Makes the Items Scrollable
            tabs: <Widget>[ //Design the tab icons here
            Tab(icon: Icon(Icons.account_box), text: "Profile"), //it can be any widget, not just icons
            Tab(icon: Icon(Icons.pin_drop), text: "Maps"),
            Tab(icon: Icon(Icons.add_call), text: "Contact Us"),
            Tab(icon: Icon(Icons.settings), text: "Customer Support"),
            Tab(icon: Icon(Icons.add_a_photo), text: "Camera"),
          ], indicatorColor: Colors.white, labelColor: Colors.white, unselectedLabelColor: Colors.grey),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black, child: Text('</>', style: TextStyle(color: Colors.white, fontSize: 20)), onPressed: () {showCode();},
        ),
        body: TabBarView(children: <Widget>[ //Design the view for each tab here
          Center(child: Text('Profile Page')),
          Center(child: Text('Maps Page')),
          Center(child: Text('Contact Us Page')),
          Center(child: Text('Customer Support')),
          Center(child: Text('Camera'))
        ],
        ),
      ),
    );
  }

  void showCode() {
    Dialog dialog = ApplicationConstants.getCodeDialog('https://docs.google.com/document/d/e/2PACX-1vT2bTHHanh5M9Hj6d1ORpVAG2MZQs_TDYmfqSU0Vh3gllar5vfv2DOrpsNTFSsi4EjlLS-BchPUqUv_/pub');
    showDialog(context: context, builder: (context) => dialog);
  }
}